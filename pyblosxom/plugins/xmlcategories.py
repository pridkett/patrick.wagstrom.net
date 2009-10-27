# vim: tabstop=4 shiftwidth=4
"""
Walks through your blog root figuring out all the categories you have
and how many entries are in each category.  It generates html with
this information and stores it in the $categorylinks variable which
you can use in your head or foot templates.

Original HTML version by:
   Will Guaraldi - willg at bluesock dot org

This version will spit out XML stuff instead.  To use it you'll want
to include this somewhere:

<my:categories>
$xmlcategories
</my:categories>

Each entry then will look like this:

<my:category url="http://dreams.wagstrom.net:8080/weblog/meta" num="6" name="meta" fullname="/meta"/>

Which you can then use an XSLT stylesheet to transform into something more useful
"""
__author__ = "Patrick Wagstrom - wagspat at iit dot edu"
__version__ = "$Id: xmlcategories.py,v 1.1 2003/11/01 01:25:08 patrick Exp $"

from Pyblosxom import tools
import re, os

class PyblCategories:
    def __init__(self, request):
        self._request = request
        self._categories = None

    def __str__(self):
        if self._categories == None:
            self.genCategories()
        return self._categories

    def genitem(self, item):
        itemlist = item.split(os.sep)

        num = 0
        for key in self._elistmap.keys():
            if key.find(item) == 0:
                num = num + self._elistmap[key]
        return "<my:category url=\"%s%s%s\" num=\"%s\" name=\"%s\" fullname=\"%s\"/>" % (self._baseurl, item, self._flavour, num, itemlist[-1], item)

    def genCategories(self):
        config = self._request.getConfiguration()
        root = config["datadir"]

        flav = config.get("category_flavour", "")
        if flav:
            self._flavour = "?flav=" + flav
        else:
            self._flavour = ""

        self._baseurl = config.get("base_url", "")

        # build the list of entries
        elist = tools.Walk(root)
        elist = [mem[len(root):] for mem in elist]

        elistmap = {}
        for mem in elist:
            mem = os.path.dirname(mem)
            elistmap[mem] = 1 + elistmap.get(mem, 0)
            mem = mem.split(os.sep)
        self._elistmap = elistmap

        clistmap = {}
        for mem in elistmap.keys():
            mem = mem.split(os.sep)
            for i in range(len(mem)+1):
                p = os.sep.join(mem[0:i])
                clistmap[p] = 0
        clist = clistmap.keys()
        clist.sort()

        clist = map(self.genitem, clist)
        self._categories = "\n".join(clist)


def cb_prepare(args):
    request = args["request"]
    data = request.getData()
    data["xmlcategories"] = PyblCategories(request)
