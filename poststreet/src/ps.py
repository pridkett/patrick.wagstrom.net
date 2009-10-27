#!/usr/bin/python
from config import cfg
from optparse import OptionParser
import sys
import os
import logging
import datetime
import time
import util
from db import *

logging.basicConfig()
log = logging.getLogger("postStreet")
log.setLevel(logging.INFO)

def deserializeText(text):
    """Attempts to deserialize a file into

    @param text: the body of the text to deserialize
    @return: a dict with elements such as "body", "tags", "title", "date"
    """
    import re
    dateRE = re.compile(r"""<!--\s*[dD][aA][tT][eE]:\s*(\d{4}-\d{2}-\d{2} \d+:\d{2})\s*-->\s*\n""")
    tagRE = re.compile(r"""<my:tags>\s*\n(\s*<my:tag>([^<]+)</my:tag>\s*\n)+\s*</my:tags>""")

    text = text.splitlines()
    
    rv = {}
    rv["tags"] = []
    rv["title"] = text[0].strip()
    text = "\n".join(text[1:])
    dm = dateRE.search(text)
    if dm:
        # python 2.5 only
        # rv["date"] = time.strptime(dm.groups(0)[0], "%Y-%m-%d %H:%M")
        rv["date"] = datetime.datetime(*(time.strptime(dm.groups(0)[0], "%Y-%m-%d %H:%M")[0:6]))
        text = text.replace(dm.group(),"")
    else:
        raise Exception("No Date Found")

    tm = tagRE.search(text)
    if tm:
        import xml.dom.minidom
        tagXML = """<?xml version="1.0"?>\n%s""" % (tm.group().replace("<my:tag","<tag").replace("</my:tag","</tag"))
        doc = xml.dom.minidom.parseString(tagXML)
        rv["tags"] = [x.childNodes[0].nodeValue for x in doc.getElementsByTagName("tag")]
        text = text.replace(tm.group(),"")
    else:
        log.info("No tags found")

    rv["body"] = text.strip()
    return rv

def importFile(inFile, userName, weblogId, categoryName, entryName):
    if userName:
        user = User.select(User.q.name == userName)[0]
    else:
        user = User.get(1)
        log.info("No user specified, using user %s", user.name)
        
    weblog = Weblog.get(weblogId)
    category = None

    # if no category name is specified, then we use the filename as the category name
    if categoryName == None: categoryName = os.path.split(inFile)[0]
    
    for c in [x for x in categoryName.split("/") if x]:
        tempCat = Category.select(AND(Category.q.name==c, Category.q.weblog==weblog, Category.q.parent==category))
        if tempCat.count():
            category = tempCat[0]
        else:
            category = Category(name=c, parent=category, weblog=weblog)

    # if no title is specified, we assume the filename is the title
    if not entryName:
        entryName = os.path.splitext(os.path.split(inFile)[1])[0]

    # see if we're just updating the story...
    entry = Entry.select(AND(Entry.q.name == entryName, Entry.q.weblog == weblog, Entry.q.category == category))
    # entry = Entry.select()

    # read in the input file
    text = open(inFile).read()
    # parse the entry
    entryDict = deserializeText(text)
    
    # this is an existing entry
    if entry.count() > 0:
        entry = entry[0]
        entry.body = entryDict["body"]
        entry.title = entryDict["title"]
        entry.createDate = entryDict["date"]
        entry.modifyBy = user
        entry.modifyDate = datetime.datetime.now()
        
        log.info("updating entry %d", entry.id)
        tags = []
        for t in entryDict["tags"]:
            tt = Tag.select(Tag.q.name==t)
            if tt.count(): tags.append(tt[0])
            else: tags.append(Tag(name=t))
        newTags = list(tags)
        
        currentTags = [x for x in TagEntry.select(AND(TagEntry.q.entryID==entry.id, TagEntry.q.createByID==user.id),
                                                  distinct=True)]
        for ct in currentTags:
            if ct.tag in tags:
                try:
                    newTags.remove(ct.tag)
                except: pass
            else:
                ct.destroySelf()
        for nt in newTags:
            TagEntry(entry=entry, tag=nt, createBy=user)
            
    else:
        log.info("creating new entry")
        entry = Entry(title=entryDict["title"], name=entryName, body=entryDict["body"], weblog=weblog, createBy=user,
                      category=category, createDate=entryDict["date"], modifyDate=entryDict["date"],
                      publishDate=entryDict["date"])
        # this is done to override the trigger
        entry.createDate = entryDict["date"]
        tags = []
        for t in entryDict["tags"]:
            tt = Tag.select(Tag.q.name==t)
            if tt.count(): tags.append(tt[0])
            else: tags.append(Tag(name=t))
        for tag in tags:
            te = TagEntry.select(AND(TagEntry.q.entry==entry.id, TagEntry.q.tagID == tag.id,
                                     TagEntry.q.createBy==user.id), distinct=True)
            if not te.count():
                TagEntry(entry=entry, tag=tag, createBy=user)

    util.translate_entry(entry)

def exportFile(title, outFile=None, weblogId=None):
    weblog = Weblog.get(weblogId)
    components = title.split("/")

    if len(components) == 1:
        title = os.path.splitext(title)[0]
        entry = Entry.select(AND(Entry.q.name == title, Entry.q.weblogID==weblog.id))
        print entry
        if entry.count() > 1:
            raise Exception("Unable to unique identify story")
        entry = entry[0]
    else:
        title = os.path.splitext(components.pop())[0]
        category = None
        for comp in components:
            category = Category.select(AND(Category.q.name==comp, Category.q.parentID==category.id, Category.q.weblogID==weblog.id))[0]
        entry = Entry.select(AND(Entry.q.name == title, Entry.q.categoryID==category.id, Entry.q.weblogID==weblog.id))[0]

    if not outFile: outFile=title+".txt"
    f = open(outFile, "w")
    f.write(entry.title+"\n")
    f.write("<!-- Date: %s -->\n\n" % (entry.createDate.strftime("%Y-%m-%d %H:%M")))
    f.write(entry.body)
    f.write("\n")
    if entry.tags:
        f.write("\n\n<my:tags>\n")
        for tag in entry.tags:
            f.write("    <my:tag>%s</my:tag>\n" % (tag.name))
        f.write("</my:tags>\n")
    f.close()

def retranslateEntries():
    for x in Entry.select():
        log.info("Retranslating entry %d", x.id)
        util.translate_entry(x)

def retranslateComments():
    for x in Comment.select():
        log.info("Retranslating comment %d", x.id)
        util.translate_comment(x)
        
if __name__ == "__main__":
    parser = OptionParser()
    parser.add_option("-i", "--import", action="store",
                      dest="importFile", default=None, help="import story")
    parser.add_option("-u", "--username", action="store",
                      dest="username", default=None, help="username to import story as")
    parser.add_option("-w", "--weblog", action="store",
                      dest="weblog", default=1, help="Weblog to access")
    parser.add_option("-c", "--category", action="store",
                      dest="category", default=None, help="Category to store file in")
    parser.add_option("-t", "--title", action="store",
                      dest="title", default=None, help="Title of entry (import only)")
    parser.add_option("-e", "--export", action="store",
                      dest="exportFile", default=None, help="export story")
    parser.add_option("-o", "--out", action="store",
                      dest="outputFile", default=None, help="file to save exported story to")
    parser.add_option("--transentries", action="store_true",
                      dest="transEntries", default=False, help="re-translate all entries")
    parser.add_option("--transcomments", action="store_true",
                      dest="transComments", default=False, help="re-translate all comments")
    
    (options, args) = parser.parse_args()

    connect("sqlite://" + cfg["dbfile"])
    if options.importFile and options.exportFile:
        print "Either specify --import or --export, not both!"
        sys.exit()

    if options.transEntries:
        retranslateEntries()
    if options.transComments:
        retranslateComments()

    if options.importFile:
        importFile(options.importFile, userName=options.username, weblogId=int(options.weblog), categoryName=options.category, entryName=options.title)

    if options.exportFile:
        exportFile(title=options.exportFile, outFile=options.outputFile, weblogId=options.weblog)
    
