"""
Generates a flexible XML calendar for use with XSLT style sheet translations.

There really isn't an XML schema for how this does it, but maybe one day if I
get ambitious enough I'll whip one up.  Anyway, it should be pretty obvious
after taking a quick look at the output.

To use place $xmlcalendar in the appropriate template

Based on pycalendar.py by Will Guaraldi - willg at bluesock dot org
"""
__author__ = "Patrick Wagstrom - wagspat at iit dot edu"
__version__ = "$Id: xmlcalendar.py,v 1.3 2003/11/02 02:31:14 patrick Exp $"

from Pyblosxom import tools
import time, calendar, string

class PyblXMLCalendar:
    def __init__(self, request):
        self._request = request
        self._cal = None

        self._today = None
        self._view = None
        self._specificday = None

        self._entries = {}

    def __str__(self):
        """
        Returns the on-demand generated string.
        """
        if self._cal == None:
            self.generateCalendar()

        return self._cal

    def generateCalendar(self):
        """
        Generates the calendar.  We'd like to walk the archives
        for things that happen in this month and mark the dates
        accordingly.  After doing that we pass it to a formatting
        method which turns the thing into HTML.
        """
        config = self._request.getConfiguration()
        data = self._request.getData()
        entry_list = data["entry_list"]

        root = config["datadir"]
        baseurl = config.get("base_url", "")
        
        self._today = time.localtime()

        if len(entry_list) == 0:
            # if there are no entries, we shouldn't even try to
            # do something fancy.
            self._cal = ""
            return

        view = list(entry_list[0]["timetuple"])

        # this comes in as 2001, 2002, 2003, ...  so we can convert it
        # without an issue
        temp = data.get("pi_yr", time.strftime("%Y", self._today))
        if temp:
            view[0] = int(temp)

        # the month is a bit harder since it can come in as "08", "", or
        # "Aug" (in the example of August).
        temp = data.get("pi_mo", time.strftime("%m", self._today))
        if temp.isdigit():
            temp = int(temp)
        else:
            if tools.month2num.has_key(temp):
                temp = int(tools.month2num[temp])
            else:
                temp = view[1]
        view[1] = temp

        view = tuple(view)
        self._view = view

        # if we're looking at a specific day, we figure out what it is
        try:
            if data["pi_yr"] and data["pi_mo"] and data["pi_da"]:
                if data["pi_mo"].isdigit():
                    mon = data["pi_mo"]
                else:
                    mon = tools.month2num[data["pi_mo"]]

                self._specificday = [data["pi_yr"], mon, data["pi_da"]]
                self._specificday = tuple([int(mem) for mem in self._specificday])
        except:
            pass

        archiveList = tools.Walk(root)

        yearmonth = {}

        for mem in archiveList:
            timetuple = tools.filestat(mem)

            # if we already have an entry for this date, we skip to the
            # next one because we've already done this processing
            day = str(timetuple[2]).rjust(2)
            if self._entries.has_key(day):
                continue

            # add an entry for yyyymm so we can figure out next/previous
            year = str(timetuple[0])
            dayzfill = string.zfill(timetuple[1], 2)
            yearmonth[year + dayzfill] = time.strftime("%b", timetuple)

            # if the entry isn't in the year/month we're looking at with
            # the calendar, then we skip to the next one
            if timetuple[0:2] != view[0:2]:
                continue

            # mark the entry because it's one we want to show
            datepiece = time.strftime("%Y/%b/%d", timetuple)
            self._entries[day] = (baseurl + "/" + datepiece, day)


        # create the calendar
        calendar.setfirstweekday(calendar.SUNDAY)
        cal = calendar.monthcalendar(view[0], view[1])
        
        # insert the days of the week
        cal.insert(0, ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"])

        # figure out next and previous links by taking the dict of yyyymm
        # strings we created, turning it into a list, sorting them,
        # and then finding "today"'s entry.  then the one before it 
        # (index-1) is prev, and the one after (index+1) is next.
        keys = yearmonth.keys()
        keys.sort()
        thismonth = time.strftime("%Y%m", view)

        # do some quick adjustment to make sure we didn't pick
        # a yearmonth that's outside the yearmonths of the entries we
        # know about.
        if thismonth in keys:
            index = keys.index(thismonth)
        elif len(keys) == 0 or keys[0] > thismonth:
            index = 0
        else:
            index = len(keys) - 1

        # build the prev link
        if index == 0:
            prev = None
        else:
            prev = "%s/%s/%s" % (baseurl, keys[index-1][:4], yearmonth[keys[index-1]])

        # build the next link
        if index == len(yearmonth)-1:
            next = None
        else:
            next = "%s/%s/%s" % (baseurl, keys[index+1][:4], yearmonth[keys[index+1]])

        # insert the month name and next/previous links
        cal.insert(0, [prev, time.strftime("%B %Y", view), next])

        self._cal = self.formatXML(cal)


    def _fixlink(self, link):
        if link:
            return "<a href=\"%s\">%s</a>" % (link[0], link[1])
        else:
            return " "

    def _fixday(self, day):
        if day == 0:
            return "<my:calendarDay/>"

        strday = str(day).rjust(2)
        if self._entries.has_key(strday):
            entry = self._entries[strday]
            link = entry[0]
        else:
            link = strday

        # if it's today
        if (self._view[0], self._view[1], day) == self._today[0:3]:
            if self._entries.has_key(strday):
                return "<my:calendarDay type=\"Today\" link=\"%s\">%s</my:calendarDay>" % (link, strday)
            return "<my:calendarDay type=\"Today\">%s</my:calendarDay>" % (strday)

        if self._specificday:
            # if it's the day we're viewing
            if (self._view[0], self._view[1], day) == self._specificday:
                return "<my:calendarDay type=\"Current\" link=\"%s\">%s</my:calendarDay>" % (link, strday)

        # if it's a day that's been blogged
        if self._entries.has_key(strday):
            return "<my:calendarDay link=\"%s\">%s</my:calendarDay>" % (link, strday)

        return "<my:calendarDay>%s</my:calendarDay>" % strday

    def formatXML(self,cal):
        """
        Format the entire calendar as XML
        """
        config = self._request.getConfiguration()
        monthlink = config.get("base_url", "")+"/"+str(self._view[0])+"/"+calendar.month_abbr[self._view[1]]
        s = "<my:calendar title=\"%s\" year=\"%s\" month=\"%s\" abbr=\"%s\" link=\"%s\"" % (cal[0][1], str(self._view[0]), 
                                                                    calendar.month_name[self._view[1]],
                                                                    calendar.month_abbr[self._view[1]],
                                                                    monthlink)
        if cal[0][0]:
            s = s + " leftLink=\"%s\"" % (cal[0][0])
        if cal[0][2]:
            s = s + " rightLink=\"%s\"" % (cal[0][2])
        s = s + ">"
        cal2 = [s]
        cal2.append("<my:calendarHeader>%s</my:calendarHeader>" % "".join(["<my:calendarDay type=\"Header\">%s</my:calendarDay>" % (m) for m in cal[1]]))

        for mem in cal[2:]:
            mem = [self._fixday(m) for m in mem]
            cal2.append("<my:calendarRow>" + "".join(mem) + "</my:calendarRow>")
        cal2.append("</my:calendar>")
        return "\n".join(cal2)

def cb_prepare(args):
    request = args["request"]
    data = request.getData()
    if data.has_key("entry_list") and data["entry_list"]:
        data["xmlcalendar"] = PyblXMLCalendar(request)

# vim: tabstop=4 shiftwidth=4
