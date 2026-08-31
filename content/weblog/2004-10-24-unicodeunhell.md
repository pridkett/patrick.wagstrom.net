---
date: '2004-10-24T23:47:00-04:00'
old:
  layout: post
  oldcategories:
  - python
  status: published
  timestamp: 11:47 PM Sunday, October 24, 2004 EDT
  wordpress_id: '295'
slug: unicodeunhell
tags:
- python
title: Escaping Unicode Hell
url: /weblog/2004/10/24/unicodeunhell/
---

Here is my attempt at escaping unicode hell.  Basically this looks for
any bit in a string that is about 128 and changes it to the appropriate
XML encoding.





    <tt><b><font color="#0000FF">def</font></b> <b><font color="#000000">cleanString</font></b><font color="#990000">(</font>instr<font color="#990000">)</font><font color="#990000">:</font>
    <i><font color="#9A1900">    """Takes an input string, and encodes the bytes for XML stuff.</font></i>
    <i><font color="#9A1900"></font></i>
    <i><font color="#9A1900">    Hopefully this should alleviate a lot of the problems we've been having</font></i>
    <i><font color="#9A1900">    with feeds that turn out to not be readable.</font></i>
    <i><font color="#9A1900"></font></i>
    <i><font color="#9A1900">    @param instr: input string</font></i>
    <i><font color="#9A1900">    @return: instr converted so it uses the & encoding from XML</font></i>
    <i><font color="#9A1900">    """</font></i>
        outstr <font color="#990000">=</font> <font color="#FF0000">""</font>
    <b><font color="#0000FF">for</font></b> x <b><font color="#0000FF">in</font></b> instr<font color="#990000">:</font>
    <b><font color="#0000FF">if</font></b> <b><font color="#000000">ord</font></b><font color="#990000">(</font>x<font color="#990000">)</font> <b><font color="#0000FF">in</font></b> <b><font color="#000000">range</font></b><font color="#990000">(</font><font color="#993399">128</font><font color="#990000">)</font><font color="#990000">:</font>
                outstr <font color="#990000">+</font><font color="#990000">=</font> x
            <b><font color="#0000FF">else</font></b><font color="#990000">:</font>
                outstr <font color="#990000">+</font><font color="#990000">=</font> <font color="#FF0000">"&x%x;"</font> <font color="#990000">%</font> <b><font color="#000000">ord</font></b><font color="#990000">(</font>x<font color="#990000">)</font>
    <b><font color="#0000FF">return</font></b> outstr
    </tt>