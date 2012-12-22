title: Flavours based on Browser Version
timestamp: 10:41 PM Sunday, October 26, 2003 EST
status: published
slug: browserflavour
tags:
- meta
url: /weblog/2003/10/26/browserflavour/

layout: post
oldcategories:
- meta
wordpress_id: '123'

---

Okay, so I've got an XML/XSLT version of my weblog that I've been working on.
I would like for the XML/XSLT version to be the default for browsers like
Mozilla and Firebird while retaining the HTML version for the rest of my
website.  However, Pyblosxom doesn't allow this.  Until now!  There were a few
steps to this project that needed to be completed.  The first was stopping
Pyblosxom from escaping out > and < when sending out content type of
"text/xml".  That's what this patch is for:




    
    --- /home/patrick/src/pyblosxom-0.8.1/Pyblosxom/renderers/blosxom.py	Fri Sep 26 00:57:31 2003
    +++ blosxom.py	Sun Oct 26 19:00:39 2003
    @@ -117,12 +117,13 @@
    
             output = []
    
    -        if re.search(r'\Wxml', data['content-type']):
    -            quotes = {"'":"'", '"':"""}
    -            entry['title'] = escape(entry['title'],quotes)
    -            entry.setData(escape(entry.getData(),quotes))
    +        # if re.search(r'\Wxml', data['content-type']):
    +            # quotes = {"'":"&apos;", '"':"&quot;"}
    +            # entry['title'] = escape(entry['title'],quotes)
    +            # entry.setData(escape(entry.getData(),quotes))
    
    -        elif data['content-type'] == 'text/plain':
    +        # elif data['content-type'] == 'text/plain':
    +        if data['content-type'] == 'text/plain':
                 s = tools.Stripper()
                 s.feed(entry.getData())
                 s.close()
    





As you can see, this just comments out the old functionality, so it's easy
enough to replace if you need it at a later time.  The other step was to allow
a lookup of the appropriate default flavor.  Here's the patch that allows that:




    
    --- /home/patrick/src/pyblosxom-0.8.1/Pyblosxom/pyblosxom.py	Wed Aug  6 18:40:25 2003
    +++ ../Pyblosxom/pyblosxom.py	Sun Oct 26 21:32:40 2003
    @@ -144,11 +144,29 @@
    
             return valid_list
    
    +    def browserSpecificFlavour(self,args):
    +        """
    +        Allow for specific default flavors based on the version of the browser.
    +
    +        @param args: dict containing the incoming Request object
    +        @type args: L{Pyblosxom.Request.Request}
    +        """
    +        request = args['request']
    +        config = request.getConfiguration()
    +        pyhttp = request.getHttp()
    +        flavourREs = config.get('browserFlavour', [])
    +        userAgent = pyhttp['HTTP_USER_AGENT']
    +        for x in flavourREs:
    +            matchobj = re.search(x[0],userAgent)
    +            if matchobj:
    +                return x[1]
    +        return None
    +
         def processPathInfo(self, args):
             """
             Process HTTP PATH_INFO for URI according to path specifications, fill in
             data dict accordingly
    -
    +
             The paths specification looks like this:
                 - C{/cat} - category
                 - C{/2002} - year
    @@ -167,14 +185,15 @@
    
             form = self._request.getHttp()["form"]
             data['flavour'] = (form.has_key('flav') and
    -                form['flav'].value or
    +                form['flav'].value or
    +                self.browserSpecificFlavour(args) or
                     config.get('defaultFlavour', 'html'))
    
             path_info = []
             data['pi_yr'] = ''
             data['pi_mo'] = ''
             data['pi_da'] = ''
    -
    +
             if pyhttp.get('PATH_INFO', ''):
                 path_info = pyhttp['PATH_INFO'].split('/')
             path_info = [x for x in path_info if x != '']
    





There are a few spots there where the patch could be tightened because I got
rid of some spaces, but oh well, too late now.  Now the final step is to add
the lines to your config.py file to support all of this.  Here is the lines
that I have to make the defaultFlavour "html" and have newer version of Mozilla
use "xml".  Basically, this looks at the user agent of the browser, and if
"rv:1.4" or greater is found, the it returns the default as XML.




    
    py['defaultFlavour'] = 'html'
    py['browserFlavour'] = [ ['rv:1.[4-9]','xml'] ]
    





Unfortunately, right now this only works on the main page for the browser.  I'm
working on a way to have it change links and always spit out XML/XSLT.  When
that happens I'll post it to this category too.  Happy Hacking!

