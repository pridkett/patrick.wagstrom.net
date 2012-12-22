title: Idiocy with C#
timestamp: 10:47 PM Saturday, April 24, 2004 EDT
status: published
slug: damncsharp
tags:
- code
url: /weblog/2004/04/24/damncsharp/

layout: post
oldcategories:
- code
wordpress_id: '288'

---

I just wasted three hours of my life debugging some C# code because what should
have been public class RandomString was only marked
as class RandomString.  This meant it worked fine
when it was linked into the main program, but didn't like being in a seperate
assembly.  So remember kids, the public statement is
important.

