"""
analytics.py

This script connects to a remote IMAP server, looks into a folder, and pulls
out the first message with an attachment.  Ideally, this means that you've got
a mail filter running that puts your mail from google in a set folder.

This file is meant to be run daily from a cron task
""" 
import xml.dom.minidom
import xml.xpath
import re
import imaplib
import email
import sys
from poststreet import STORY_EXTENSIONS, get_category_stories, db_connect
from sqlobject import sqlbuilder
from db import Tag, Weblog, TopContent, TopContentTags, TopContentCategories, TopContentEntries
from optparse import OptionParser
import urllib

# these may need to be configured depending on where installed poststreet
DATE_RE=re.compile(r"^/weblog/[\d]{4}")                   # Filter out dates too
ENTRY_RE=re.compile(r"^/weblog/(.*)(?:\.html|\.xml)$")    # Entries we tell by extensions
TAG_RE=re.compile(r"^/weblog/tags/([^/]*)$")              # TAG regular expression we only go 1 deep
CATEGORY_RE=re.compile(r"^/weblog/(.+)$")                 # Basically, everything else is a category, we assume at least

def get_attachment(msg, save=False):
    """Given a email message gets the attachment from the message
    
    I'm not 100% positive if this works for messages with multiple attachments, but
    for the most part we're only concerned about messages with a single attachment.
    """
    rv = []
    for part in msg.walk():
        if part.is_multipart():
            # print "multipart -- ignoring"
            continue
        filename = part.get_filename()
        # print "filename: ", filename
        if not filename:
            # ignore things without a filename
            continue
        body = part.get_payload(decode=True)
        rv.append(body)
        if save:
            fp = open(filename,'wb')
            fp.write(body)
            fp.close()
    return rv, filename

def process_xml(doc):
    doc = xml.dom.minidom.parseString(doc)
    nodes = xml.xpath.Evaluate("""/AnalyticsReport/Report[@name="Top Content"]/Table[@id="Table"]/Row/Key""", doc.documentElement)

    topEntries = []
    topTags = []
    topCategories = []

    for n in [x.firstChild.nodeValue for x in nodes]:
        if DATE_RE.match(n):
            continue
        if ENTRY_RE.match(n):
            topEntries.append(ENTRY_RE.match(n).groups()[0])
            continue
        if TAG_RE.match(n):
            topTags.append(TAG_RE.match(n).groups()[0])
            continue
        if CATEGORY_RE.match(n):
            topCategories.append(CATEGORY_RE.match(n).groups()[0])
            continue

    return topEntries, topTags, topCategories

def get_mail(username, password, folder, server, save=False):
    m = imaplib.IMAP4_SSL(server)
    m.login(username, password)
    typ, data = m.select(folder)
    typ, data = m.fetch(int(data[0]), '(RFC822)')
    msg = email.message_from_string(data[0][1])
    docs, filename = get_attachment(msg, save)
    return docs, filename

def process_top_entries(topEntries):
    outTopEntries = []
    
    for entry in topEntries:
        if len(outTopEntries) >= 10: break
        en = entry + STORY_EXTENSIONS[0]
        category, entries, singleEntry = get_category_stories(en)
        if singleEntry and entries.count() == 1:
            outTopEntries.append(entries[0])        
    return outTopEntries

def process_top_tags(topTags):
    outTopTags = []
    
    for tag in topTags:
        if len(outTopTags) >= 10: break   # only iterate until we have 10 valid entries
        t = Tag.select(sqlbuilder.func.lower(Tag.q.name)==urllib.unquote_plus(tag.lower()))
        if t.count() > 0:
            outTopTags.append(t[0])
        else:
            print "unable to fetch tag: %s" % (tag)
    return outTopTags

def process_top_categories(topCategories):
    outTopCategories = []
    for category in topCategories:
        if len(outTopCategories) >= 10: break
        try:
            cat, entries, singleEntry = get_category_stories(category)
            outTopCategories.append(cat)
        except Exception, e:
            pass
    return outTopCategories


def do_main(username, password, folder, server, save=False):
    db_connect()
    # fixme: this should be parametrizable
    weblog = Weblog.get(1)
    docs, filename = get_mail(username, password, folder, server, save)
    topEntries, topTags, topCategories = process_xml(docs[0])
    outTopEntries = process_top_entries(topEntries)
    outTopTags = process_top_tags(topTags)
    outTopCategories = process_top_categories(topCategories)
    tc = TopContent(weblog=weblog, filename=filename)
    for i, en in enumerate(outTopEntries):
        TopContentEntries(topContent=tc, entry=en, rank=i)
    for i, tg in enumerate(outTopTags):
        TopContentTags(topContent=tc, tag=tg, rank=i)
    for i, cat in enumerate(outTopCategories):
        TopContentCategories(topContent=tc, category=cat, rank=i)
        
if __name__ == "__main__":
    parser = OptionParser()
    parser.add_option("-u", "--username", action="store",
                      dest="username", default=None, help="IMAP username")
    parser.add_option("-p", "--password", action="store",
                      dest="password", default=None, help="IMAP password")
    parser.add_option("-f", "--folder", action="store",
                      dest="folder", default=None, help="IMAP folder")    
    parser.add_option("-s", "--server", action="store",
                      dest="server", default="imap.gmail.com", help="IMAP server")
    parser.add_option("--save", action="store_true", dest="save",
                      default=False, help="save XML file from Google")
    
    (options, args) = parser.parse_args()
    if not (options.username or options.password or options.server or options.folder):
        print "Must specify username, password, server, and folder on the command line"
        sys.exit()

    do_main(username=options.username, password=options.password,
            folder=options.folder, server=options.server, save=options.save)
