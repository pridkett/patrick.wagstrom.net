title: What Qualifies as an Open Source Project?
timestamp: 09:26 PM Saturday, February 13, 2010 EST
status: published
slug: what-qualifies-as-an-open-source-project
tags:
- academic
- opensource
- community
- research
url: /weblog/2010/02/13/what-qualifies-as-an-open-source-project/

layout: post
oldcategories:
- academic
- opensource
oldtags:
- community
- opensource
- research
wordpress_id: '849'

---

I spent the last few days at the [FOSS2010 Workshop](http://foss2010.isr.uci.edu/) in Irvine, CA.  It's an interesting little workshop that brought together some of the best minds in Open Source research from academia, industry, and practice.  The goal was to develop a roadmap for the future of Open Source research.

One issue that constantly comes up is how many Open Source projects exist.  People most often point to [SourceForge](http://sourceforge.net/) as an indicator of success, with it's claim on 230,000 projects and more than 2 million users.  However, how many of those are really projects.

First, lets look at activity on SourceForge.  It's about halfway through the day on Saturday, and according to the home page here's a summary of Today's activity:

<div class="image caption center">
     {%img /media/2010/02/SourceForgeDailyStats.png %}

    <p>Activity as of Noon PST on a Saturday</p>
</div>

If there are actually 230,000 active projects this amount is laughable.  I'll be generous and say that bug tracking activity is less on a Saturday, so we assume that the 12 hours of data represent 1/1,000 of yearly activity, we're getting less than three bugs per project a year.

I polled some of the other folks at the workshop for a definition of a project and I think we've gotten a pretty good idea. First, there is a selection of general project process attributes:
	
  * Code available under an Open Source license
  * Publicly accessible web page, bug trackers, mailings lists, and version control
  * Governance model that allows outside contribution

The license is actually the only item that is necessary to call a project Open Source, while publicly accessible collaboration resources and a governance model that allows for participation are conditions that are required for any sort of community to emerge.  However, under these terms it still is possible to have a project that is run by a single person and isn't really open.  I can still create a project, release it under an Open Source license, register it on SourceForge, and say I accept contributions, but it won't really be Open Source in most people's definition of the words.

After talking to various other quite intelligent people within the community I'd like to propose the following criteria for calling a project truly Open Source:
	
  * At least three different contributors
  * Code that can be compiled and run by someone with only moderate skill in the field and without significant external resources
  * A social process that not only allows contribution, but actively mentors new developers
  * Active participation by individuals who write no code

I'll go over each of these criteria and explain why they're necessary for a first cut of determining whether or not a project is truly Open Source.

One of the key elements of Open Source development is that it is a collaborative effort by multiple developers.  Advantages include utilizing the expertise of each of the different developers and having many developers looking over the code to ensure to identify bugs.  If a project is just one or two people then it is unlikely that there is always enough overlap of individuals examining code.  Furthermore, it's unlikely that the strategy process for designing and developing new features needs to be collaborative at all.  Fortunately, this is something that can be easily ascertained through automated methods when mining software communities.

The next requirement is that the project actually be able to compile by people of moderate skill in the field.  This is important because not everyone in the field of interest is going to be an expert.  If you require everyone to be an expert then the community will have trouble growing.  Requiring expensive libraries or exotic compilers has a similar effect and dramatically limits the pool of individuals.  It also may signify that the community really isn't interested in harness the resources of an open community.  This raises some interesting questions about existing projects, for example, VISTA is a widely used system for managing hospital infrastructure from the Veterans Administration of the United States, but it written in MUMPS, a language that few people know and with even fewer compilers (I'm aware that in the strictest sense VISTA isn't Open Source anyway, as the core is public domain, but we'll ignore that for now).  How does this compare to open source code designed to run on Oracle's high end databases?  I don't have a clear answer, but when weighing projects it's something to be aware of.

Next up is a social process that mentors new developers.  Sadly this is one place where many Open Source projects end up falling flat.  For example, GLIBC under the iron hand of Ulrich Drepper fails this category.  When dealing with potential future developers, it's necessary to actively ensure they learn the process.  This includes simple things such as helping developers understand the process roadmap, explaining why bugs are rejected or marked as dupes, and responding to users on mailing lists in a gentle manner.  Now clearly, at some point projects need to put some of the impetus for learning on the potential community members or we'll end up with hundreds of Bowie J. Poags, but I'd imagine for every Bowie you'll get a couple of genuinely helpful developers.

The final issue is obtaining contributions from individuals who don't write code.  For a long time there has been a perception that the code is all that really matters.  This was reinforced through some early writing such as the Cathedral and the Bazaar and misinterpretations of Lessig's Code.  The most successful projects all have numerous individuals who write no code, instead they write documentation, create art, support users on the mailing lists and chat channels, and act as general promoters of the software across all media. The fact of the matter is that although I know many skilled coders who may excel in some of these additional areas, they can't do it all alone.  Without these other individuals, you don't really have an Open Source project.

I don't claim that these criteria are perfect for identifying "true" Open Source projects, but they do help to ensure that projects at least have some of the key elements of what is generally considered to be Open Source and have a chance of being successful. I also don't see this as competing with something like Tony Wasserman's [Open BRR](http://www.openbrr.org/), rather, for individuals researching Open Source they should be a guideline for identifying projects that will be interesting and exhibit the behaviors that make Open Source interesting to study in the first place.
