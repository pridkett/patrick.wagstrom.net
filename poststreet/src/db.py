from sqlobject import SQLObject, sqlhub, connectionForURI
from sqlobject import StringCol, IntCol, DateTimeCol, BoolCol, ForeignKey
from sqlobject import RelatedJoin, MultipleJoin
from sqlobject.sqlbuilder import *
from sqlobject import sqlbuilder
import datetime
import urllib
import re

IFRAME_RE = re.compile("<iframe.*?</iframe>", flags=re.DOTALL)
IFRAME_RE2 = re.compile("<iframe[^<>]*/>", flags=re.DOTALL)


def wordpress_nice(inname):
	return inname.lower().replace(" ","").replace("&","").replace(":","").replace("'","")

def wordpress_date(indate, delta=None):
    """
    Makes a nice date that wordpress will like
    @param indate:
    @param delta: a delta, for things like GMT
    """
    if not delta:
        delta = datetime.timedelta(0)
    newdate = indate + delta
    return newdate.strftime("%Y-%m-%d %H:%M:%S")
    
def isoPubDate(indate):
    #FIXME: need to do something better for time zones...yech
    return indate.strftime("%a, %d %b %Y %H:%M:%S -0500")

def rssBody(instr):
    """Special routine that handles some issues with source escaped characters
    in RSS feeds"""
    instr = IFRAME_RE.sub("", IFRAME_RE2.sub("", instr))
    instr = instr.replace("&lt;","&amp;lt;").replace("&gt;","&amp;gt;").replace("<","&lt;").replace(">","&gt;")
    instr = instr.replace(r'href="/','href="http://patrick.wagstrom.net/')
    instr = instr.replace(r'src="/','src="http://patrick.wagstrom.net/')
    return instr

class Avatar(SQLObject):
    name = StringCol(length=255)
    width = IntCol()
    height = IntCol()
    createDate = DateTimeCol(default=None)
    createBy = ForeignKey('User', default=None, dbName="create_by")
    modifyDate = DateTimeCol(default=None)
    modifyBy = ForeignKey('User', default=None, dbName="modify_by")
    
class User(SQLObject):
    class sqlmeta:
        table = "users"
    name = StringCol(length=255)
    realName = StringCol(length=255)
    email = StringCol(length=255)
    url = StringCol(length=255)
    password = StringCol(length=255)
    avatar = ForeignKey('Avatar')
    createDate = DateTimeCol(default=None)
    modifyDate = DateTimeCol(default=None)
    
class TranslatorClass(SQLObject):
    name = StringCol(length=64)
    createDate = DateTimeCol(default=None)
    createBy = ForeignKey('User', dbName="create_by")

class Translator(SQLObject):
    name = StringCol(length=64)
    translatorClass = ForeignKey('TranslatorClass')
    data = StringCol()
    createDate = DateTimeCol(default=None)
    createBy = ForeignKey('User', default=None, dbName="create_by")
    modifyDate = DateTimeCol(default=None)
    modifyBy = ForeignKey('User', default=None, dbName="modify_by")

class Weblog(SQLObject):
    title = StringCol(length=255)
    subtitle = StringCol(length=255, default=None)
    translator = ForeignKey('Translator')
    prefix = StringCol(length=255, default=None)
    commentTranslator = ForeignKey('Translator')
    createDate = DateTimeCol(default=None)
    createBy = ForeignKey('User', default=None, dbName="create_by")
    modifyDate = DateTimeCol(default=None)
    modifyBy = ForeignKey('User', default=None, dbName="modify_by")

class Tag(SQLObject):
    name = StringCol(length=255, alternateID=True, notNone=True)
    createDate = DateTimeCol(default=None)
    entries = RelatedJoin('Entries', intermediateTable='entry_tag',
                          joinColumn='tag_id', otherColumn='entry_id')
    def encodedName(self):
        return urllib.quote_plus(self.name)

    def nice_name(self):
        return wordpress_nice(self.name)

class TagEntry(SQLObject):
    entry = ForeignKey("Entry")
    tag = ForeignKey("Tag")
    createDate = DateTimeCol(default=None)
    createBy = ForeignKey("User", dbName="create_by")
    
class Category(SQLObject):
    name = StringCol(length=255)
    weblog = ForeignKey('Weblog')
    parent = ForeignKey('Category', default=None)
    createDate = DateTimeCol(default=None)
    
    entries = MultipleJoin('Entry', joinColumn='category_id')
    children = MultipleJoin('Category', joinColumn='parent_id')

    def allChildren(self):
        rv = [self]
        for child in self.children:
            rv = rv + child.allChildren()
        return rv
    
    def fullParents(self):
        if self.parent:
            return self.parent.fullParents() + "/" + self.name
        return self.name

    def parents(self, nest=False):
        if nest == False:
            if self.parent:
                return self.parent.parents(nest=True)
            else:
                return []
        else:
            if self.parent:
                return [self] + self.parent.parents(nest=True)
            else:
                return [self]
            
    def fullParentIds(self):
        if self.parent:
            return [self.id] + self.parent.fullParentsIds()
        return [self.id]

    def encodedName(self):
        return urllib.quote_plus(self.name)

    def nice_parent(self):
        """
        Returns either the name of the parent or an empty string
        """
        if self.parent:
            return self.parent.name
        return ""

    def nice_name(self):
        return wordpress_nice(self.name)


class Entry(SQLObject):
    title = StringCol(length=255, notNone=True)
    name = StringCol(length=255, notNone=True)
    translator = ForeignKey('Translator', default=None)
    commentTranslator = ForeignKey('Translator', default=None)
    body = StringCol(notNone=True, default=None)
    translatedBody = StringCol(default=None)
    weblog = ForeignKey('Weblog', notNone=True, default=1)
    category = ForeignKey('Category', default=None)
    createDate = DateTimeCol(default=None)
    createBy = ForeignKey('Users', dbName="create_by", default=1)
    modifyDate = DateTimeCol(default=None)
    modifyBy = ForeignKey('Users', dbName="modify_by", default=1)
    publishDate = DateTimeCol(default=None)
    published = BoolCol(default=True)
    tags = RelatedJoin('Tag', intermediateTable='tag_entry',
                              joinColumn='entry_id', otherColumn='tag_id')
    comments = MultipleJoin('Comment', joinColumn='entry_id')

    def isoPubDate(self):
        return isoPubDate(self.publishDate)

    def rssBody(self):
        """Special routine that handles some issues with source escaped characters
        in RSS feeds"""
        return rssBody(self.translatedBody)

    def permalink(self):
        """Generates a permalink for this element"""
        return self.category.fullParents() + "/%s.xml" % self.name
        # return "%04d/%02d/%02d/%s.xml" % (self.publishDate.year, self.publishDate.month, self.publishDate.day, self.name)
    
    def post_date(self):
        return wordpress_date(self.publishDate)
    def gmt_post_date(self):
        return wordpress_date(self.publishDate, delta=datetime.timedelta(seconds=60*60*5))
    
class Comment(SQLObject):
    entry = ForeignKey("Entry")
    title = StringCol(length=255, default=None)
    parent = ForeignKey("Comment", default=None)
    body = StringCol(default=None)
    translatedBody = StringCol(default=None)
    name = StringCol(length=255, default=None)
    email = StringCol(length=255, default=None)
    url = StringCol(length=255, default=None)
    remoteAddr = StringCol(length=255, default=None)
    createDate = DateTimeCol(default=None)
    createBy = ForeignKey("User", default=None, dbName="create_by")
    modifyDate = DateTimeCol(default=None)
    modifyBy = ForeignKey("User", default=None, dbName="modify_by")

    def rssBody(self):
        return rssBody(self.translatedBody)

    def isoPubDate(self):
        return isoPubDate(self.createDate)

    def post_date(self):
        return wordpress_date(self.createDate)
    def gmt_post_date(self):
        return wordpress_date(self.createDate, delta=datetime.timedelta(seconds=60*60*5))

class TopContent(SQLObject):
    weblog = ForeignKey("Weblog")
    createDate = DateTimeCol(default=None)
    filename = StringCol(length=255, default=None)
    
class TopContentTags(SQLObject):
    topContent = ForeignKey("TopContent")
    rank = IntCol()
    tag = ForeignKey("Tag")
    
class TopContentEntries(SQLObject):
    topContent = ForeignKey("TopContent")
    rank = IntCol()
    entry = ForeignKey("Entry")

class TopContentCategories(SQLObject):
    topContent = ForeignKey("TopContent")
    rank = IntCol()
    category = ForeignKey("Category")

def connect(uri, debug=False, cache=None, process=True):
    global connection
    global sqlhub
    
    connection = connectionForURI(uri)
    if process:
        sqlhub.processConnection = connection

    if debug:
        connection.debug = True
    if cache != None:
        connection.cache = cache
    return connection

