---
date: '2009-12-06T19:46:00-05:00'
old:
  layout: post
  oldcategories:
  - code
  - python
  status: published
  timestamp: 07:46 PM Sunday, December 06, 2009 EST
  wordpress_id: '761'
oldtags:
- code
- markdown
- restructured text
- trac
- wiki
slug: textile-markup-in-trac
tags:
- wiki
- markdown
- trac
- code
- python
- restructured text
title: Textile Markup in Trac
url: /weblog/2009/12/06/textile-markup-in-trac/
---

For a new secret project I’ve been putting together an installation of Trac to provide a web interface for task management. I found myself wanting to create a nice looking table within a Trac wiki page to document different dependencies needed by the software. In a normal installation there are three different ways to do this:

## Trac’s Wiki Formatting
This is probably the simplest option, however it’s also the most limiting, there is no way to provide additional styling to elements and you can’t create columns that span multiple rows or columns.  The lack of additional styling is particularly difficult because you can’t correct it easily with CSS without modifying all of the tables.

    :::moin
    || '''Client Side Packages''' ||
    || '''Package''' || '''License''' || '''Purpose''' ||
    || [http://jquery.com/ jQuery] || [http://docs.jquery.com/Licensing MIT or GPL] (choice) || General Purpose javascript ||
    || [http://raphaeljs.com/ Raphaël] || [http://raphaeljs.com MIT] (see sidebar) || Vector graphics library ||
    || '''Server Side Packages''' ||
    || [http://www.djangoproject.com/ Django] || [http://code.djangoproject.com/browser/django/trunk/LICENSE BSD] || Server framework ||
    || [http://pinaxproject.com/ Pinax] || [http://github.com/pinax/pinax/blob/master/LICENSE MIT] || Server social components ||
    || [http://www.sqlite.org/ SQLite] || [http://www.sqlite.org/copyright.html Public Domain] || Server database ||


<div class="image caption center">
    <img src="/weblog/media/2009/12/trac-table.png" alt="Table output using Trac Wiki Processing">
    <p>Table output using Trac Wiki Processing</p>
</div>

## HTML
HTML is of course, the go to for all of this.  However, the whole reason I started looking at this is that I didn’t want to embed a huge chunk of HTML into my wiki page.  I know I can do all the formatting I want, but this really isn’t an option.

## ReStructured Text
ReStructured Text is the preferred markup language of Python documentation.  It’s more robust than Trac Wiki formatting, especially for tables.  The processor for ReStructured Text in Trac is smart enough to tag tables with the class ‘docutils’ which helps out immensely when trying to style the documents.  This allows for the creation of some prettier tables.  It also allows the creation of header columns and multi-column/row cells.  However, it’s not great for this sort of general purpose document, for two reasons.  First,  it doesn’t allow for a header row to appear in the middle of the table.  I’d really like these to be part of the same table.  Secondly, you can’t have multiple short links with the same name.  So, I can have the name ‘MIT’ link to two different pages without doing implicit links.  However, this introduces a new third problem, which is that table cells are proportional in width to the RST equivalent.  Here’s the sample table structured in RST:

    :::rest
    +--------------+----------------------------------------------------------------------+----------------------------+
    | Client Side Packages                                                                                             |
    +--------------+----------------------------------------------------------------------+----------------------------+
    | Package      | License                                                              | Purpose                    |
    +==============+======================================================================+============================+
    | jQuery_      | `MIT or GPL <http://docs.jquery.com/Licensing>`__ (choice)           | General JavaScript library |
    +--------------+----------------------------------------------------------------------+----------------------------+
    | Raphaël_     | `MIT <http://raphaeljs.com/>`__ (see sidebar)                        | SVG/VML Library            |
    +--------------+----------------------------------------------------------------------+----------------------------+

    |

    +--------------+----------------------------------------------------------------------+---------------------------+
    | Server Side Packages                                                                                            |
    +--------------+----------------------------------------------------------------------+---------------------------+
    | Package      | License                                                              | Purpose                   |
    +==============+======================================================================+===========================+
    | Django_      | `BSD <http://code.djangoproject.com/browser/django/trunk/LICENSE>`__ | Server framework          |
    +--------------+----------------------------------------------------------------------+---------------------------+
    | Pinax_       | `MIT <http://github.com/pinax/pinax/blob/master/LICENSE>`__          | Server social components  |
    +--------------+----------------------------------------------------------------------+---------------------------+
    | SQLite_      | `Public Domain <http://www.sqlite.org/copyright.html>`__             | Server database           |
    +--------------+----------------------------------------------------------------------+---------------------------+

    .. _jQuery: http://jquery.com/
    .. _Raphaël: http://raphaeljs.com/
    .. _Django: http://www.djangoproject.com/
    .. _Pinax: http://pinaxproject.com/
    .. _SQLite: http://www.sqlite.org/


Unfortunately, this results in tables that are unnaturally wide and must be split into two different tables.  While the result is passable, especially after throwing down some CSS to help out and collapse those ugly borders, the width of the tables makes them look highly awkward, and therefor unacceptable.

<div class="image caption center">
    <img src="/weblog/media/2009/12/rst-table.png" alt="Output using ReStructured Text">
    <p>Output using ReStructured Text</p>
</div>

## Markdown
Markdown is the hotness markup language that all of the web 3.0 kiddies like to use. And why not?  It’s from John Gruber, macboy extraordinairre!  Markdown is designed to be wholly readable without people needing to know how to speak HTML.  It’s quick and easy to use.  There’s a pretty good markdown processor available for Trac.  However, there are a few shortcomings.  First, by default Markdown has no support for tables, so you’ll need to drop back to HTML for the formatting.  This is less than ideal as it’s messy again.  Furthermore you cannot use Markdown inside of an HTML table.

Fortunately, there are some extensions to Markdown that provide support for tables.  As is normal for this sort of community, it’s been further extended to allow for all sorts of crazy formatting and alignment issues.  However, as near as I can tell it still does not allow cells to span multiple columns/rows.  Or, if it does, the Markdown plugin for Trac doesn’t support it.  I didn’t really get far enough to generate anything really interesting with Markdown.

## Textile
In the world of Web 2.0 fanboys, the other competing markup, favored by the Ruby guys and folks at GitHub, is Textile.  It’s slightly similar to Markdown, in that it aims to be fairly readable, but advanced features let you do neat stuff at the expense of some readability.  Fortunately, using Textile I was able to make the table look exactly like I wanted to.  Although Textile allows you to use multiple header rows, I did have to apply some simple CSS styling to the header columns and rows.  Here’s the Textile I used.

    :::textile
    table(clean).
    |_\3. Client Side Packages                                                 |
    (bbot). |_. Package |_. License                |_. Purpose                 |
    | "jQuery":jq       | "MIT or GPL":jql (choice)| General purpose javscript |
    | "Raphaël":ra      | "MIT":ral (see sidebar)  | Vector graphics library   |
    (bbot btop). |_\3. Server Side Packages                                    |
    | "Django":dj       | "BSD":djl                | Server framework          |
    | "Pinax":pi        | "MIT":pil                | Server social components  |
    | "SQLite":sq       | "Public Domain":sql      | Server Database           |

    [jq]http://jquery.com/
    [jql]http://docs.jquery.com/Licensing
    [ra]http://raphaeljs.com/
    [ral]http://raphaeljs.com/
    [dj]http://www.djangoproject.com/
    [djl]http://code.djangoproject.com/browser/django/trunk/LICENSE
    [pi]http://pinaxproject.com/
    [pil]http://github.com/pinax/pinax/blob/master/LICENSE
    [sq]http://www.sqlite.org/
    [sql]http://www.sqlite.org/copyright.html


And here is the actual output from Trac after rendering the Textile (after a little bit of help from some CSS:

<div class="image caption center">
    <img src="/weblog/media/2009/12/textile-table.png" alt="Table output using Textile processor">
    <p>Table output using Textile processor</p>
</div>

## Trac Textile Macro
To get this far I needed to write a simple little Trac processing macro for Textile. Using information from the excellent Markdown Macro I was able to hack together a simple Textile Macro for Trac.  Before installing it you’ll need to install the Python Textile libraries.  Then, you can clone the git repository from git://github.com/pridkett/tractextilemacro.git.  From here you can install it like a normal Trac component.  Enable it in your trac.ini using these lines:


    [components]
    Textile.* = enabled


Now, just embed your Textile code in a block like this and you’ll be
on your way. Remove the double backslashes at the top of the block,
they're only there because otherwise Octopress chokes.


    \\{\\{\\{
    #!Textile

    Hello from the __magical__ land of "Textile":http://textile.thresholdstate.com/!
    }}}
