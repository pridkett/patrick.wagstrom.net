"""
xsltrenderer.py

version 0.1
October 29, 2003

copyright (c) 2003 Patrick Wagstrom <wagspat at iit dot edu>

a simple XSLT rendering plugin for pyblosxom
"""
from Pyblosxom.renderers.blosxom import BlosxomRenderer
from Pyblosxom import tools
import re
import sys
import popen2
import tempfile
import os
import cStringIO
import gzip

class XSLTRenderer(BlosxomRenderer):
    def __init__(self, request, stdoutput = sys.stdout):
        BlosxomRenderer.__init__(self, request, stdoutput)
        self.request = request
        self.data = self.request.getData()
        self.config = self.request.getConfiguration()
        self._outputBuffer = ""

    def _processEntry(self, entry, current_date):
        """
        Main workhorse of pyblosxom stories, comments and other miscelany goes
        here

        @param entry: either a dict or an Entry object
        @type  entry: dict or Entry object
        """
        output = []

        # don't do any of that escaping stuff, that's bad and will break
        # the XSLT renderer.  Other than that this function is the same
        # as the standard blosxom renderer

        if self.data['content-type'] == 'text/plain':
            s = tools.Stripper()
            s.feed(entry.getData())
            s.close()
            p = ['  ' + line for line in s.gettext().split('\n')]
            entry.setData('\n'.join(p))

        entry.update(self.data)
        entry.update(self.config)

        if entry['date'] != current_date:
            current_date = entry['date']
            if not self.dayFlag:
                self.outputTemplate(output, entry,'date_foot')
            self.dayFlag = 0
            self.outputTemplate(output, entry, 'date_head')
        self.outputTemplate(output, entry, 'story')

        template = u""
        args = self._run_callback("story_end", { "entry": entry, "template": template })

        return "".join(output)+args['template'], current_date

    def write(self, data):
        # override the actual write method with a way to append to a buffer
        self._outputBuffer = self._outputBuffer+data

    def showHeaders(self):
        # we don't want to show the headers right away because it will make it
        # impossible to run the code through the XSLT processor
        pass

    def _compressBuffer(self, useGzip):
        if not useGzip:
            return self._outputBuffer 
	zbuf = cStringIO.StringIO()
	zfile = gzip.GzipFile(mode="wb", fileobj=zbuf, compresslevel=9)
	zfile.write(self._outputBuffer.encode('utf-8'))
	zfile.close()
	buffer = zbuf.getvalue()
	self.addHeader("content-length", str(len(buffer)))
	# note: this is a hack to allow output to be gzip encoded
	self._out = sys.stdout
	return buffer

    def render(self, header = 1):
        # start out with the default renderer
        BlosxomRenderer.render(self, header)
        pyhttp = self.request.getHttp()

	useGzip = False

        if self.config.get('useGzip',False):
            if pyhttp.has_key('HTTP_ACCEPT_ENCODING'):
                # encodings = pyhttp['HTTP_ACCEPT_ENCODING'].split(",")
                # if "gzip" in encodings:
                if pyhttp['HTTP_ACCEPT_ENCODING'].find("gzip") != -1:
                    useGzip = True
                    self.addHeader("content-encoding","gzip")
       
        # if this flavour is not supposed to have XSLT translation run on it
        # then we just output the buffer as it is.  Ideally, this statement
        # should never be true anymore, but just in case, this is a failsafe
        if self.data['flavour'] not in self.config.get('xsltFlavours',[]):
            self._outputBuffer = self._compressBuffer(useGzip)
            self._out.write('\n'.join(['%s: %s' % (x, self._header[x])
                            for x in self._header.keys()]))
            self._out.write('\n\n')
            self._out.write(self._outputBuffer)
                       
            return

        # check to see if the browser is an XSLT browser
        userAgent = pyhttp['HTTP_USER_AGENT']
        flavorREs = self.config.get('xsltBrowsers',[])

        # if the browser can render XSLT natively, as indicated by the
        # xsltBrowsers config option, then we don't need to rerender it
        for x in flavorREs:
            matchobj = re.search(x,userAgent)
            if matchobj:
                self._outputBuffer = self._compressBuffer(useGzip)
                self._out.write('\n'.join(['%s: %s' % (x, self._header[x]) 
                    for x in self._header.keys()]))
                self._out.write('\n\n')
                self._out.write(self._outputBuffer)
                return
        #
        # otherwise do the XSLT transform
        #

        # find the sheet
        # eventually this will also be automated, where it digs in the XML, but
        # that is not the case now.  Instead it looks in the dict from the
        # configuration file
        xsltSheetDict = self.config.get('xsltSheets',{})
        if xsltSheetDict.has_key(self.data['flavour']):
            xsltSheet = xsltSheetDict[self.data['flavour']]
        else:
            # FIXME: some error processing would go here
            xsltSheet = "/NOFILEFOUND"
        xsltEngine = self.config.get('xsltEngine','xsltproc')
        xsltEngineParams = self.config.get('xsltEngineParams',{})

        content = None

        # try to use libxslt if it's requested
        if (self.config.get('xsltEngine','') == 'libxslt'):
            # try:
                # this is needed to render without shelling out
                import libxml2
                import libxslt

                # print "Content-Type: text/plain\n"
                # print "foo"
                # print self._outputBuffer.__class__.__name__

                doc = libxml2.parseDoc(self._outputBuffer.encode('utf-8'))

                # this attempts to find the xml-stylesheet tag in the document
                # if it can find it, then it overwrites the original stylesheet request
                ss = None
                rootNode = doc.children
                while ss == None and rootNode != None:
                    if rootNode.name == 'xml-stylesheet':
                        matchObj = re.match('.*href="([^"]*)"',rootNode.content)
                        if matchObj:
                            ss = matchObj.groups()[0]
                            if self.config.get('serverBase',None):
                                xsltSheet  = self.config.get('serverBase','')+os.sep+ss
                    else:
                        rootNode = rootNode.get_next()

                styledoc = libxml2.parseFile(xsltSheet)
                style = libxslt.parseStylesheetDoc(styledoc)

                result = style.applyStylesheet(doc,xsltEngineParams)
                content = style.saveResultToString(result)

                # try to figure out the content type based on the XSLT method parameter
                contentMapping = self.config.get('xsltContentMapping',{})
                outputMethod = style.method()
                if contentMapping.has_key(outputMethod):
                    self.addHeader('Content-type', contentMapping[outputMethod])
                else:
                    self.addHeader('Content-type', "text/html")

                # style.freeStylesheet()
                # doc.freeDoc()
                # result.freeDoc()
            # except:
                # pass

        # if xsltproc is requested or the page hasn't been rendered yet, do this
        if (self.config.get('xsltEngine','') == 'xsltproc' or content == None):
            # store the output buffer to a temp file
            tf = tempfile.mktemp(".xml")
            f = open(tf,"w")
            f.write(self._outputBuffer)
            f.close()

            xsltEngineParamsString = " ".join(["--param %s %s" % (mem, xsltEngineParams[mem]) 
                                               for mem in xsltEngineParams])

            f = open(tempfile.mktemp(".txt"),"w")
            f.write("""%s %s %s %s""" % (xsltEngine, xsltEngineParamsString, xsltSheet, tf))
            f.close()

            childStdout, childStdin, childStderr = popen2.popen3("""%s %s %s %s""" % (xsltEngine, xsltEngineParamsString, xsltSheet, tf))
            childStdin.close()
            content = ""
            while 1:
                line = childStdout.readline()
                if not line: break
                content = content + line

            # os.unlink(tf)
            childStdout.close()
            childStderr.close()
            self.addHeader('Content-type', 'text/html')

        # in theory this should also be validated too...it's conceivable that
        # there might be different output methods than just text/html, for
        # instance, someone may do a transform to SVG for a certain flavour
	self._outputBuffer = content.decode('utf-8')
	self._outputBuffer = self._compressBuffer(useGzip)
        self._out.write('\n'.join(['%s: %s' % (x, self._header[x]) 
           for x in self._header.keys()]))
        self._out.write('\n\n')

        self._out.write(self._outputBuffer)


class Renderer(XSLTRenderer):
    pass

def cb_renderer(args):
    request = args['request']
    data = request.getData()
    config = request.getConfiguration()
    form = request.getHttp()["form"]
    flavour = (form.has_key('flav') and form['flav'].value or config.get('defaultFlavour','html'))

    # if this is a flavour that we're using XSLT on, then return this renderer
    if flavour in config.get('xsltFlavours',[]):
        return XSLTRenderer(args['request'])
    return None
