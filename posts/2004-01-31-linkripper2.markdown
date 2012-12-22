title: An updated version of link ripper
timestamp: 01:03 PM Saturday, January 31, 2004 EST
status: published
slug: linkripper2
tags:
- code
url: /weblog/2004/01/31/linkripper2/

layout: post
oldcategories:
- code
wordpress_id: '317'

---

I noticed that my original implementation of
[linkripper](/weblog/code/linkripper.xml) was put in [Mark Pilgrim's](http://www.diveintomark.org/) [blinks archive for January](http://www.diveintomark.org/archives/blinks/2004/01/).  This inspired me
to go and update linkripper to automagically open up zip files, so you don't
need to do that on your own.  Behold, the new version of Linkripper:




    
    <i><font color="#9A1900"># linkripper.py</font></i>
    <i><font color="#9A1900"># by Patrick Wagstrom</font></i>
    <i><font color="#9A1900"># this work is dedicated to the public domain</font></i>
    <i><font color="#9A1900"># see: http://creativecommons.org/licenses/publicdomain/</font></i>
    <b><font color="#0000FF">import</font></b> libxml2
    <b><font color="#0000FF">import</font></b> sys
    <b><font color="#0000FF">import</font></b> zipfile
    
    <b><font color="#0000FF">def</font></b> <b><font color="#000000">readfile</font></b><font color="#990000">(</font>filename<font color="#990000">)</font><font color="#990000">:</font>
        data <font color="#990000">=</font> None
        <b><font color="#0000FF">try</font></b><font color="#990000">:</font>
            zip <font color="#990000">=</font> zipfile<font color="#990000">.</font><b><font color="#000000">ZipFile</font></b><font color="#990000">(</font>filename<font color="#990000">,</font> <font color="#FF0000">'r'</font><font color="#990000">)</font>
            data <font color="#990000">=</font> zip<font color="#990000">.</font><b><font color="#000000">read</font></b><font color="#990000">(</font><font color="#FF0000">"content.xml"</font><font color="#990000">)</font>
    <b><font color="#0000FF">except</font></b> zipfile<font color="#990000">.</font>BadZipfile<font color="#990000">:</font>
            data <font color="#990000">=</font> <b><font color="#000000">file</font></b><font color="#990000">(</font>filename<font color="#990000">,</font><font color="#FF0000">'r'</font><font color="#990000">)</font><font color="#990000">.</font><b><font color="#000000">read</font></b><font color="#990000">(</font><font color="#990000">)</font>
    <b><font color="#0000FF">except</font></b> KeyError<font color="#990000">:</font>
    <b><font color="#0000FF">print</font></b> <font color="#FF0000">"%s is a zip file, but does not have content.xml in the archive"</font> <font color="#990000">\</font>
    <font color="#990000">%</font> <font color="#990000">(</font>filename<font color="#990000">)</font>
    <b><font color="#0000FF">return</font></b> data
    
    
    <b><font color="#0000FF">def</font></b> <b><font color="#000000">riplinks</font></b><font color="#990000">(</font>filename<font color="#990000">)</font><font color="#990000">:</font>
    <b><font color="#0000FF">try</font></b><font color="#990000">:</font>
            doc <font color="#990000">=</font> libxml2<font color="#990000">.</font><b><font color="#000000">parseDoc</font></b><font color="#990000">(</font><b><font color="#000000">readfile</font></b><font color="#990000">(</font>filename<font color="#990000">)</font><font color="#990000">)</font>
            ctxt <font color="#990000">=</font> doc<font color="#990000">.</font><b><font color="#000000">xpathNewContext</font></b><font color="#990000">(</font><font color="#990000">)</font>
            ctxt<font color="#990000">.</font><b><font color="#000000">xpathRegisterNs</font></b><font color="#990000">(</font><font color="#FF0000">"xlink"</font><font color="#990000">,</font><font color="#FF0000">"http://www.w3.org/1999/xlink"</font><font color="#990000">)</font>
            res <font color="#990000">=</font> <font color="#990000">[</font><font color="#990000">]</font>
    <b><font color="#0000FF">for</font></b> mem <b><font color="#0000FF">in</font></b> ctxt<font color="#990000">.</font><b><font color="#000000">xpathEval</font></b><font color="#990000">(</font><font color="#FF0000">"//*[@xlink:href]"</font><font color="#990000">)</font><font color="#990000">:</font>
                res<font color="#990000">.</font><b><font color="#000000">append</font></b><font color="#990000">(</font>mem<font color="#990000">.</font><b><font color="#000000">prop</font></b><font color="#990000">(</font><font color="#FF0000">"href"</font><font color="#990000">)</font><font color="#990000">)</font>
    <b><font color="#0000FF">return</font></b> res
        <b><font color="#0000FF">except</font></b><font color="#990000">:</font>
    <b><font color="#0000FF">print</font></b> <font color="#FF0000">"%s is unable to be parsed"</font> <font color="#990000">%</font> <font color="#990000">(</font>filename<font color="#990000">)</font>
    <b><font color="#0000FF">return</font></b> <font color="#990000">[</font><font color="#990000">]</font>
    <b><font color="#0000FF">if</font></b> __name__ <font color="#990000">=</font><font color="#990000">=</font> <font color="#FF0000">"__main__"</font><font color="#990000">:</font>
    <b><font color="#0000FF">if</font></b> <b><font color="#000000">len</font></b><font color="#990000">(</font>sys<font color="#990000">.</font>argv<font color="#990000">)</font> <font color="#990000"><</font> <font color="#993399">2</font><font color="#990000">:</font>
    <b><font color="#0000FF">print</font></b> <font color="#FF0000">"Usage: %s FILENAME"</font> <font color="#990000">%</font> <font color="#990000">(</font>sys<font color="#990000">.</font>argv<font color="#990000">[</font><font color="#993399">0</font><font color="#990000">]</font><font color="#990000">)</font>
            sys<font color="#990000">.</font><b><font color="#000000">exit</font></b><font color="#990000">(</font><font color="#993399">0</font><font color="#990000">)</font>
    <b><font color="#0000FF">for</font></b> fn <b><font color="#0000FF">in</font></b> sys<font color="#990000">.</font>argv<font color="#990000">[</font><font color="#993399">1</font><font color="#990000">:</font><font color="#990000">]</font><font color="#990000">:</font>
    <b><font color="#0000FF">for</font></b> mem <b><font color="#0000FF">in</font></b> <b><font color="#000000">riplinks</font></b><font color="#990000">(</font>fn<font color="#990000">)</font><font color="#990000">:</font>
    <b><font color="#0000FF">print</font></b> mem
    
