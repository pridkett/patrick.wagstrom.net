#!/usr/bin/python
"""
Generic utility functions for PostStreet
"""

from db import *
import logging
import sys
from config import cfg
import re

logging.basicConfig()
log = logging.getLogger("psUtils")
log.setLevel(logging.INFO)

def replaceStrings(inStr):
    """Takes a string and replaces macro values
    """
    inStr = inStr.replace("$STATIC",cfg["staticDir"])
    return inStr

def run_translator_source_highlight(translator, body):
    """This highlightor uses pygments to highlight the output source code"""
    from pygments import highlight
    from pygments.lexers import get_lexer_by_name
    from pygments.formatters import HtmlFormatter

    # this should find all the code...
    r = re.compile("<code language=\"([^\"]+)\">(.*?)</code>", re.DOTALL)

    match = r.search(body)
    while match:
        log.debug("highlighting %s source code block", match.groups()[0])
        lexer = get_lexer_by_name(match.groups()[0])
        formatter = HtmlFormatter(linenos="inline", cssclass="sourceHighlight")
        result = highlight(match.groups()[1], lexer, formatter)
        body = body.replace(match.group(), result).replace("&lt;?xml version=", "&lt;&#63;xml version=")
        match = r.search(body)
    return body

def run_translator_chain(translator, body):
    """A translator that runs multiple subtranslators in sequence
    to clean up the input"""
    log.info("Running Translator Chain")
    subTrans = [int(x) for x in translator.data.split(":")]
    for t in subTrans:
        trans = Translator.get(t)
        body = translator_switch(trans, body)
    return body

def run_translator_beautiful_soup(translator, body):
    """This is a simple translator that runs the entry through
    beautiful to get a document that can at least be parsed

    @param translator: the translator, which doesn't matter becuase they're all the same
    @param entry: the entry to clean up"""
    from BeautifulSoup import BeautifulSoup

    # unfortunately, BeautifulSoup mangles pre tags, this means that it will
    # destroy any chunks of source code highlighting present in your code
    preservationCTR = 0
    preservationDict = {}
    r = re.compile("<div class=\"sourceHighlight\">(.*?)</div>", re.DOTALL)
    match = r.search(body)
    while match:
        preservationTKN = """::XX:: CODE BLOCK %d ::XX::""" % preservationCTR
        preservationDict[preservationTKN] = match.group()
        body = body.replace(match.group(), preservationTKN, 1)
        preservationCTR += 1
        match = r.search(body)
        
    body = str(BeautifulSoup(body))

    # reinsert all of the code blocks
    for key, value in preservationDict.iteritems():
        body = body.replace(key, value, 1)
    return body

def run_translator_xslt(translator, body):
    import libxml2
    import libxslt

    xsltEngineParams = {}
    docString = r"""<?xml version="1.0"?><my:entry xmlns:my="http://patrick.wagstrom.net/xml/blog/1">%s</my:entry>""" % (body)
    doc = libxml2.parseDoc(docString)

    td = translator.data
    if td.startswith("file:"):
        td = replaceStrings(td.lstrip("file:"))
        styledoc = libxml2.parseFile(td)
    else:
        styledoc = libxml2.parseDoc(td)
    style = libxslt.parseStylesheetDoc(styledoc)
    result = style.applyStylesheet(doc, xsltEngineParams)
    content = style.saveResultToString(result)
    styledoc.freeDoc()
    result.freeDoc()
    # save the results to the object
    return content.strip()


def run_translator_text_to_html(translator, body):
    """Simple translator that replaces any linebreaks with HTML
    breaks.  Useful for most comments"""
    return body.replace("\n","<br/>\n")

def translator_switch(translator, body):
    if translator.translatorClass.name == "XSLT":
        return run_translator_xslt(translator, body)
    elif translator.translatorClass.name == "BEAUTIFUL_SOUP":
        return run_translator_beautiful_soup(translator, body)
    elif translator.translatorClass.name == "CHAIN_TRANSLATOR":
        return run_translator_chain(translator, body)
    elif translator.translatorClass.name == "SOURCE_HIGHLIGHT":
        return run_translator_source_highlight(translator, body)
    elif translator.translatorClass.name == "TEXT_TO_HTML":
        return run_translator_text_to_html(translator, body)
    else:
        log.error("Unable to handle translator class %s", translator.translatorClass.name)
        sys.exit()

def translate_comment(comment):
    translator = comment.entry.weblog.commentTranslator
    if not translator:
        comment.translatedBody = comment.body
    else:
        comment.translatedBody = translator_switch(translator, comment.body)

def translate_entry(entry):
    if entry.translator:
        translator = entry.translator
    else:
        translator = entry.weblog.translator

    if not translator:
        entry.translatedBody = entry.body
        return
    entry.translatedBody = translator_switch(translator, entry.body)
    
def translateEntry(entry):
    """Updates an entry by running the item through the appropriate translator

    @param entry: handle to the weblog article
    """
    raise Exception("translateEntry is deprecated!  use translate_entry")
