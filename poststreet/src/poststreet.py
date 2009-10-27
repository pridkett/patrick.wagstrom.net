#!/usr/bin/python
"""
PostStreet - A Simple database driven weblog

Copyright (c) 2008 Patrick Wagstrom
"""
import cgi
import cgitb
cgitb.enable()
from Cheetah.Template import Template
import os
import sys
import util
import datetime
import urllib

from config import cfg
from db import *

STORY_EXTENSIONS = [".html", ".xml"]

def print_headers(headers, cookies=None):
    """
    Takes the accumulated headers and prints them to stdout
    
    @param headers: a dict containing hears and values
    @param cookies: an object showing all of the cookies
    """
    if not headers.has_key("Content-Type"): 
        headers["Content-Type"] = "text/html; charset=utf-8"
    if cookies:
        sys.stdout.write(cookies.output() + "\n")
    for header_name, header_value in headers.items():
        sys.stdout.write('%s: %s\n' % (header_name, header_value))
    sys.stdout.write('\n')

def process_redirect(redirecturl, cookies=None):
    """
    Handles sending a 302 redirect to a web browser
    
    @param redirecturl: the URL to send the client to
    @param cookies: any cookies that should be sent
    """
    sys.stdout.write("Status: 302 Moved\n")
    if cookies:
        sys.stdout.write(cookies.output() + "\n")
    sys.stdout.write("Location: %s\n" % (redirecturl))
    sys.stdout.write("\n")
    sys.exit()

def load_template(filename):
    """
    Loads a template from the template directory
    @param filename: the name of the file to load
    """
    return open(cfg["templateDir"] + os.sep + filename).read()

def output_template(templatename, searchlist=None, headers=None, cookies=None, exitafter=True):
    """
    Prints out headers and processes the template
    
    @param templatename: the name of the template to load
    @param searchlist: the dict of template fill-in values
    @param headers: various other headers to send to the client
    @param cookies: cookies to send to the client
    @param exitafter: should the script immediately exit after outputting the template
    """
    if not searchlist:
        searchlist = []
    if not headers:
        headers = {}
    print_headers(headers, cookies=cookies)
    searchlist.append({"CGI_URL": cfg["cgiURL"], "TEMPLATE_DIR": cfg["templateDir"],
                       "REQUEST_ACTION": REQUEST_ACTION, "REQUEST_URI": REQUEST_URI,
                       "SERVER_NAME": SERVER_NAME, "CSS_PREFIX": cfg["cssPrefix"],
                       "IMG_PREFIX": cfg["imgPrefix"]})
    
    template = Template(load_template(templatename), searchList=searchlist)
    sys.stdout.write(str(template))
    if exitafter:
        sys.exit()

def process_add_comment():
    form = cgi.FieldStorage()
    namespace = {"weblog": Weblog.get(1)}
    # FIXME: should be more graceful about errors
    try:
        entry = Entry.get(int(form.getvalue("entryID")))
    except:
        namespace["error"] = "Unable to determine article for comment"
        return output_template("error.html", [namespace])
    
    name = form.getvalue("yourName","")
    url = form.getvalue("url","")
    email = form.getvalue("email","")
    answer = form.getvalue("answer","")
    body = form.getvalue("commentBody","")

    if not name or not email or not answer or not body:
        namespace["error"] = "When entering a comment, make sure you enter data for your name, email, bot question, and comment"
        return output_template("error.html", [namespace])

    # FIXME: this should be a better error message
    if not answer.isdigit() or int(answer) != 3:
        namespace["error"] = "Your answer indicates you may be a robot"
        namespace["actions"] = ""
        return output_template("error.html", [namespace])


    
    c = Comment(entry=entry, name=name, url=url, email=email, body=body, remoteAddr=os.getenv("REMOTE_ADDR"),
                createDate=datetime.datetime.now(), modifyDate=datetime.datetime.now())
    util.translate_comment(c)
    redirectURL = "http://" + SERVER_NAME + cfg["cgiURL"] + "/" + entry.category.fullParents() + "/" + entry.name + ".xml#comments"
    process_redirect(redirectURL)

def process_form(actions):
    """Handles requests to process a form"""
    if actions[0] == "addComment":
        process_add_comment()
    else:
        raise Exception("Unknown parameters passed to process form: " + str(actions))

def get_date_entries(actions):
    """Finds all entries that correspond to a particular date and returns them.

    If this is found to refer to a single entry, return just that entry.

    @param actions: a list containing all of the actions
    """
    MONTHS=["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]
    year, month, day, storyName = None, None, None, None
    if actions[0].isdigit() and len(actions[0]) == 4:
        year = int(actions[0])
    else:
        raise Exception("No year passed.  I'm confused")
    if len(actions) > 1 and actions[1].isdigit() and len(actions[1]) and len(actions[1]) <= 2:
        month = int(actions[1])
    elif len(actions) > 1 and actions[1].lower() in MONTHS:
        month = MONTHS.index(actions[1].lower()) + 1
    elif len(actions) > 1:
        raise Exception("Unable to parse month")
    if len(actions) > 2 and actions[2].isdigit() and len(actions[2]) <= 2:
        day = int(actions[2])
    elif len(actions) > 2:
        raise Exception("Unable to parse day")
    if len(actions) == 4:
        if os.path.splitext(actions[3])[1] in STORY_EXTENSIONS:
            storyName = os.path.splitext(actions[3])[0]
        else:
            raise Exception("Unable to get story from link...")
    elif len(actions) > 4:
        raise Exception("Too many arguments!")
        
    if year and month and day:
        startDate = datetime.datetime(year, month, day)
        stopDate = startDate + datetime.timedelta(days=1)
    elif year and month:
        startDate = datetime.datetime(year, month, 1)
        nextMonth = month + 1
        nextYear = year
        if nextMonth == 13:
            nextYear = year + 1
            nextMonth = 1
        stopDate = datetime.datetime(nextYear, nextMonth, 1)
    elif year:
        startDate = datetime.datetime(year, 1, 1)
        stopDate = datetime.datetime(year+1, 1, 1)

    if storyName:
        entries = Entry.select(AND(Entry.q.publishDate >= startDate, Entry.q.publishDate < stopDate, Entry.q.name==storyName)) # pylint: disable-msg=E1101
        if entries.count() == 0:
            raise Exception("No story found")
        elif entries.count() > 1:
            raise Exception("Unable to uniquely identify story")
        else:
            # in the case that a single story is requested by date,
            # redirect to actual permalink
            process_redirect(cfg["cgiURL"] + "/" + entries[0].permalink())
    else:
        return Entry.select(AND(Entry.q.publishDate >= startDate, # pylint: disable-msg=E1101
                                Entry.q.publishDate < stopDate),  # pylint: disable-msg=E1101
                            orderBy="-publishDate"), False
        

def get_tag_stories(storypath):
    """
    Gets the stories from the database with the combination of tags in storypath
    
    @param storypath: a "/" separated string of tags
    """   
    actions = storypath.split("/")
    qhold, tables, sqlstring = [],[],[]
    tags = Tag.select(IN(sqlbuilder.func.lower(Tag.q.name), [urllib.unquote_plus(y.lower()) for y in actions])) # pylint: disable-msg=E1101
    for i,tag in enumerate([urllib.unquote_plus(y) for y in actions]):
        tabl1 = 'jk%d'%i
        tabl2 = 'ij%d'%i
        # FIXME: SQL INJECTION VULNERABILITY!
        qhold.append ("entry.id = %s.entry_id and %s.tag_id = %s.id and lower(%s.name)='%s'"%
                      (tabl1, tabl1, tabl2, tabl2, tag.replace(";","").replace("'","").replace("\\","").lower()))
        tables.append ('tag_entry AS %s' % (tabl1))
        tables.append ('tag AS %s'%(tabl2))
        sqlstring.append ("(%s)"%' AND '.join(qhold))

    Q = ' AND '.join(sqlstring)
    entries = Entry.select(Q,clauseTables=tables, orderBy="-publishDate")
    return entries

def get_category_stories(storypath):
    """
    Gets the stories from the database corresponding to a particular path
    
    @param storypath:
    """
    actions = storypath.split("/")
    singleEntry = False
    if os.path.splitext(actions[-1])[1].lower() in STORY_EXTENSIONS:
        storyName = os.path.splitext(actions[-1])[0]
        actions.pop()
    else:
        storyName = None
    category = None
    for cat in actions:
        try:
            category = Category.select(AND(Category.q.name==cat, Category.q.parent==category))[0] # pylint: disable-msg=E1101
        except:
            raise KeyError("unable to find category '%s'" % (cat))
    # now, we know the category, go through and get all of the children
    catIds = [x.id for x in category.allChildren()]
    if not storyName:
        entries = Entry.select(IN(Entry.q.categoryID, catIds), orderBy="-publishDate", distinct=True) # pylint: disable-msg=E1101
    else:
        entries = Entry.select(AND(IN(Entry.q.categoryID, catIds), Entry.q.name==storyName), # pylint: disable-msg=E1101 
                               orderBy="-publishDate", distinct=True)
        singleEntry = True
    return category, entries, singleEntry

def get_top_content(weblog):
    tc = TopContent.select(TopContent.q.weblogID == weblog.id, orderBy=DESC(TopContent.q.createDate)) # pylint: disable-msg=E1101
    try:
        tc = tc[0]
    except:
        return [],[],[]
    top_entries = [x.entry for x in TopContentEntries.select(TopContentEntries.q.topContentID == tc.id, orderBy=TopContentEntries.q.rank)] # pylint: disable-msg=E1101,E1103
    top_categories = [x.category for x in TopContentCategories.select(TopContentCategories.q.topContentID == tc.id, orderBy=TopContentCategories.q.rank)] # pylint: disable-msg=E1101,E1103
    top_tags = [x.tag for x in TopContentTags.select(TopContentTags.q.topContentID == tc.id, orderBy=TopContentTags.q.rank)] # pylint: disable-msg=E1101,E1103
    return top_entries, top_categories, top_tags

def dump_all():
    """
    Catchall function that dumps everything from the database
    """
    namespace = {"weblog": Weblog.get(1), "entries": Entry.select(orderBy=Entry.q.id),
                 "categories": Category.select(orderBy=Category.q.id),
                 "tags": Tag.select(orderBy=Tag.q.id)}
    return output_template("wordpress.xml", [namespace])    
    
def output_stories(action):
    singleEntry = False
    outputRSS = False
    weblog = Weblog.get(1)
    category = None

    # split up the actions
    actions = [x for x in action.split("/") if x]

    if actions and actions[0] == "dump":
        return dump_all()
    
    # check for form operations
    if actions and actions[0] == "form":
        actions = actions[1:]
        return process_form(actions)
        
    # check for RSS
    if actions and actions[-1] == "index.rss":
        outputRSS = True
        actions.pop()

    startEntry = 0
    try:
        if (actions[-2]) == "start":
            startEntry = int(actions[-1])
            actions.pop()
            actions.pop()
    except:
        pass
    

    if not actions:
        entries = Entry.select(orderBy="-publishDate")
    elif actions[0].isdigit() and len(actions[0]) == 4:
        entries, singleEntry = get_date_entries(actions)      
    elif actions[0] == "tags":
        entries = get_tag_stories("/".join(actions[1:]))
    else:
        category, entries, singleEntry = get_category_stories("/".join(actions))


    # get all of the sections
    topLevelCategories = [x for x in Category.select(AND(Category.q.parentID==None, Category.q.weblogID==weblog.id), # pylint: disable-msg=E1101
                                                     orderBy=Category.q.name)] # pylint: disable-msg=E1101
        
    topEntries, topCategories, topTags = get_top_content(weblog)
    namespace = {'entries': [x for x in entries[startEntry:startEntry+10]],
                 'startEntry': startEntry, 'query': str(entries),
                 'weblog': weblog, 'singleEntry': singleEntry,
                 'numEntries': entries.count(), 'topLevelCategories': topLevelCategories,
                 'currentCategory': category,
                 'actions': "/".join(actions), "topEntries": topEntries,
                 "topCategories": topCategories, "topTags": topTags}
    if namespace["actions"]: namespace["actions"] = "/" + namespace["actions"]
    
    if outputRSS:
        return output_template("main.rss", [namespace], headers={"Content-Type": "application/rss+xml"})
    if singleEntry:
        namespace["entry"] = namespace["entries"][0]
        return output_template("single.html", [namespace])
    else:
        return output_template("main.html", [namespace])

def db_connect():
    """Connects to the database"""
    connect("sqlite://" + cfg["dbfile"])
    
if __name__ == "__main__":
    db_connect()
    SERVER_NAME=os.getenv("SERVER_NAME")
    REQUEST_URI=os.getenv("REQUEST_URI")
    if REQUEST_URI.startswith(cfg["cgiURL"]):
        REQUEST_ACTION=REQUEST_URI[len(cfg["cgiURL"]):].lstrip("/")
    else:
        raise Exception("Don't know how to process URL")
    output_stories(REQUEST_ACTION)
    
