"""
Simple plugin to provide at $daord and $day variable in the form
of 5th and 5 instead of 05.  Provides some flexibility.

"""
__author__ = "Patrick Wagstrom - wagspat at iit dot edu"
__version__ = "1.0"
__url__ = "http://patrick.wagstrom.net/projects/"

def ordinalth(n):
    t = 'th st nd rd th th th th th th'.split()
    if n % 100 in (11, 12, 13): #special case
        return '%dth' % n
    return str(n) + t[n % 10]

def cb_story(args):
    """
    This method gets called in the cb_story callback.  Refer to
    the documentation for that.
    """
    entry = args["entry"]

    if not entry.has_key("title"):
        entry["urlencodedtitle"] = "N/A"
        return

    if entry.has_key("da"):
        entry["daord"] = ordinalth(int(entry["da"]))
        entry['day'] = str(int(entry['da']))
