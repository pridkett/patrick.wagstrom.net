title: Ripping links out of OpenOffice Documents
timestamp: 10:22 PM Tuesday, January 13, 2004 EST
status: published
slug: linkripper
tags:
- code
url: /weblog/2004/01/13/linkripper/

layout: post
oldcategories:
- code
wordpress_id: '289'

---

Today I received one a syllabus for one of my classes as a word document with
a buch of hyper links in it.  The hyperlinks are important as they link to the
readings for the course.  Clicking them all by hand would have taken a little
while, so undaunted I sought about another way.






[OpenOffice.org](http://www.openoffice.org/) makes this quite easy.
Just save the file then unzip it and you've got some XML files with all your
document guts in it.  And as you should know, XML is yummy.  So here is the program
that I wrote to rip the links.  The program code is released to the public domain
because it's only a few lines long.

    
    <tt>
    <b><font color="#0000FF">import</font></b> libxml2
    <b><font color="#0000FF">import</font></b> sys
    
    <b><font color="#0000FF">def</font></b> <b><font color="#000000">riplinks</font></b><font color="#990000">(</font>filename<font color="#990000">)</font><font color="#990000">:</font>
        doc <font color="#990000">=</font> libxml2<font color="#990000">.</font><b><font color="#000000">parseFile</font></b><font color="#990000">(</font>filename<font color="#990000">)</font>
        ctxt <font color="#990000">=</font> doc<font color="#990000">.</font><b><font color="#000000">xpathNewContext</font></b><font color="#990000">(</font><font color="#990000">)</font>
        ctxt<font color="#990000">.</font><b><font color="#000000">xpathRegisterNs</font></b><font color="#990000">(</font><font color="#FF0000">"xlink"</font><font color="#990000">,</font><font color="#FF0000">"http://www.w3.org/1999/xlink"</font><font color="#990000">)</font>
        res <font color="#990000">=</font> <font color="#990000">[</font><font color="#990000">]</font>
    <b><font color="#0000FF">for</font></b> mem <b><font color="#0000FF">in</font></b> ctxt<font color="#990000">.</font><b><font color="#000000">xpathEval</font></b><font color="#990000">(</font><font color="#FF0000">"//*[@xlink:href]"</font><font color="#990000">)</font><font color="#990000">:</font>
            res<font color="#990000">.</font><b><font color="#000000">append</font></b><font color="#990000">(</font>mem<font color="#990000">.</font><b><font color="#000000">prop</font></b><font color="#990000">(</font><font color="#FF0000">"href"</font><font color="#990000">)</font><font color="#990000">)</font>
    <b><font color="#0000FF">return</font></b> res
    
    <b><font color="#0000FF">if</font></b> __name__ <font color="#990000">=</font><font color="#990000">=</font> <font color="#FF0000">"__main__"</font><font color="#990000">:</font>
    <b><font color="#0000FF">if</font></b> <b><font color="#000000">len</font></b><font color="#990000">(</font>sys<font color="#990000">.</font>argv<font color="#990000">)</font> <font color="#990000"><</font> <font color="#993399">2</font><font color="#990000">:</font>
    <b><font color="#0000FF">print</font></b> <font color="#FF0000">"Usage: %s FILENAME"</font> <font color="#990000">%</font> <font color="#990000">(</font>sys<font color="#990000">.</font>argv<font color="#990000">[</font><font color="#993399">0</font><font color="#990000">]</font><font color="#990000">)</font>
            sys<font color="#990000">.</font><b><font color="#000000">exit</font></b><font color="#990000">(</font><font color="#993399">0</font><font color="#990000">)</font>
    <b><font color="#0000FF">for</font></b> mem <b><font color="#0000FF">in</font></b> <b><font color="#000000">riplinks</font></b><font color="#990000">(</font>sys<font color="#990000">.</font>argv<font color="#990000">[</font><font color="#993399">1</font><font color="#990000">]</font><font color="#990000">)</font><font color="#990000">:</font>
    <b><font color="#0000FF">print</font></b> mem
    </tt>
    





Using, so for my case all of the links had the word "classpapers" in them, so I used the
following command line to download them all:




    
    python linkripper.py content.xml | grep classpapers | xargs wget





In an ideal world someone would hook this up with the zip module for python and have
it automagically look at the content.xml file if it's a
zip, but this isn't ideal right now.  I've got other stuff to do.






**Update:** I made linkripper so it uses zipfile to automagically read Open
Office documents.  Read about it [here](/weblog/code/linkripper2).

