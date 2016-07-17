---
comments: true
date: '2012-05-13T13:09:00-04:00'
old:
  layout: post
  oldcategories:
  - research
  status: published
  timestamp: 01:09 PM Sunday, May 13, 2012 EDT
oldtags:
- github
- r
- datamining
- sna
- gitminer
- tinkerpop
- gremlin
post_format: standard
slug: mining-github-followers-in-tinkerpop
tags:
- gitminer
- github
- datamining
- sna
- gremlin
- r
- research
- tinkerpop
title: Mining GitHub - Followers in Tinkerpop
url: /weblog/2012/05/13/mining-github-followers-in-tinkerpop/
---

Development of any moderately complex software package is a social
process. Even if a project is developed entirely by a single person,
there is still a social component that consists of all of the people
who use the software, file bugs, and provide recommendations for
enhancements. This social aspect is one of the driving forces behind
the proliferation of social software development sites such as
[GitHub][gh], [SourceForge][sf], [Google Code][gc], and [BitBucket][bb].

These sites combine together a variety of tools that are common for
software development such as version control, bug trackers, mailing lists,
release management, project planning, and wikis. In addition, some of
these have more social aspects that allow you find and follow
individual developers or watch particular projects. In this post I'm
going to show you how we can use some this information to gain insight
into a software development community, specifically the community
around the [Tinkerpop][tp] stack of tools for graph databases.

Graph Databases
============

Graph Databases are in the broad family of NoSQL databases. For about
30 years the dominant form of data storage and access has been through
relational databases (e.g. Oracle, MySQL, PostgreSQL, DB2, etc). These
present your data as a table with various rows. These tables can have
constraints and pointers that map a column in one table to a column in
another table through a process called a join. In this way it's
possible to create relations between records and build rich
collections of data.

Relational databases are very nice and can scale fairly well, but they're
not suitable for all problems. In particular, there may be cases where
atomicity can be sacrificed in exchange for higher performance or
where the schema of the data may frequently change resulting in severe
problems mapping the data to a traditional database.

This has led to a multitude of different solutions for data storage
and access. Some of the more popular solutions are Google's [BigTable][bt]
for distributed data storage, [MongoDB][mongo] for a schemaless document
database, and [Memcached][mc] for distributed object storage and
caching. These alternative style of databases are generally lumped
into a category of NoSQL, which means either "Not SQL" or "Not Only
SQL" or perhaps something else depending on who you speak to.

A specific subclass of NoSQL databases is graph databases. A graph
database represents your data a network of vertices and edges that
connect them. Vertices and edges can have various properties that
define the object. As opposed to traditional databases where a query
crawls over the entire table to find the appropriate elements, queries
within a graph database are often done via traversals that walk the
graph from one node to another. Examples of graph databases are
[Neo4j][neo4j], [OrientDB][orientdb], [Trinity][trinity],
[InfiniteGraph][infinitegraph], and [Dex][dex]. A complete description
of these databases are beyond the simple explanation here, but
Wikipedia has a decent [primer on graph databases][wikipedia].

Tinkerpop Background
=================

Tinkerpop is a loosely coupled virtual organization centered around
Marko Rodriguez that develops infrastructure libraries and interfaces
for graph databases.

<div class="image caption center">
    <img src="/weblog/media/2012/05/tinkerpop.png">
    <p></p>
</div>

Tinkerpop has six major projects that are hosted on Github:

* [Pipes][pipes]: A general data flow and processing framework
* [Blueprints][blueprints]: A library to abstract graph database interfaces
* [Gremlin][gremlin]: A domain specific language for traversing graphs
* [Frames][frames]: An object mapper for graph databases
* [Rexster][rexster]: A general web interface for Blueprints supported databases
* [Furnace][furnace]: A library of algorithms for traversing graphs

The Tinkerpop Network
================

As part of an ongoing research effort between IBM and the University
of Nebraska, Lincoln, I've written a tool called [GitMiner][gitminer]
that can connect to Github and pull down information on a set of
projects. In celebration of Gremlin hitting 600 watchers on Github, I
pulled the complete network for all of the Tinkerpop projects from
Github from May 1-3, 2012. This network contains the following pieces
of information:

In a future post I'll provide more details of how you can use GitMiner
to access data on your own projects. I'll also provide some pointers
to other data sets people may wish to analyze.

Getting Started with Analysis
====================

For this analysis we're going to use a couple of different software
packages. First, we'll be using Gremlin to do some queries of the
database and to create exportable networks for further
analysis. Additional analysis will be conducted using [R][r]. These
instructions are generically for people running a Mac, Linux, or other
operating system with a posix-like command line interface. If you're
on Windows you should be able to follow along but you'll need to
modify the shell commands. All the tools used in this analysis are
cross-platform, open source, and freely available.

Installing Gremlin
---------------

I'm not going to repeat everything in the [Gremlin docs][gremlindocs]
here, but here's a brief overview of what you'll need to do to get
going on a Mac or :

    cd ~
    git clone git://github.com/tinkerpop/gremlin.git
    cd gremlin
    mvn clean compile package

This assumes that you've already got a nice java development
environment setup and that you have [maven][maven] installed. If this
is your first time using maven to build any Java packages this can
take a long time as it will automatically download all of the
dependencies needed to compile and run Gremlin.

Installing R
----------

R is a language for statistical computing. It's slow, uses strange
syntax, and is a memory hog. In short, it's quite possible one of the
worst possible ways to do this analysis. However, it also is the
dominant language in the field and provides a huge number of libraries
and tutorials that we'll use for our analysis.

There are a variety of different ways to interact with R. If you're on
Windows or a Mac the standard downloads of R have a decent graphical
interface for editing scripts and running commands. If you're an Emacs
hacker, [ESS][ess] is a great library that interfaces nicely with R. If
working inside of Eclipse is your thing, then use [StatEt][statet]. Personally,
I use [R-Studio][rstudio] for most of my work. Further screenshots will be based
on R-Studio, but you should be able to follow along with other
interfaces.

Installing R-Studio is straightforward. Visit the
[R-Studio Desktop download page][rstudiodownload] and download and
install the version for your platform.

Downloading the Data
-------------------

I've posted the [Tinkerpop Social Graph][tinkerpopgraph] as a Neo4j
database, you should visit it and download
[TinkerpopSocialGraph.20120501.db.tar.gz][tinkerpopneo4j]. After
downloading it you should go into the directory where you downloaded
and compiled Gremlin and extract it. If you're on a Mac or Linux, the commands
will generally be something like this:

    cd ~/gremlin
    tar -zxvf ~/Downloads/TinkerpopSocialGraph.20120501.db.tar.gz

The dataset is fairly large, about 148MB compressed. It's quite a bit
of data and if you're a lazy student taking your first SNA class it
should have enough data to do a really kick-ass class project. If
you're a grad student and interested in writing a paper on this sort
of data [email me][emailme] and we can probably collaborate.

Exploring the Graph
==================

Gremlin provides a interactive interpreter that we can use to explore
the graph. You can start it up by running `./gremlin.sh`. Then run the
following commands. lines that begin with `gremlin>` are the lines you
should type into the interpreter.

To begin with we we'll connect to graph and get a specific node from
the database. In this case, we'll pull up the node that represents
Marko Rodriguez, the main developer of tools from Tinkerpop.

    :::groovy
             \,,,/
             (o o)
    -----oOOo-(_)-oOOo-----
    gremlin> g = new Neo4jGraph("tinkerpop/tinkerpop.db")
    ==>neo4jgraph[EmbeddedGraphDatabase [/Users/pwagstro/gremlin/tinkerpop/tinkerpop.db]]
    gremlin> marko = g.idx("user-idx").get("login","okram").next()
    ==>v[8]
    gremlin> marko.map()
    ==>location=Santa Fe, New Mexico
    ==>sys_last_updated=1335930109
    ==>blog=http://markorodriguez.com
    ==>type=USER
    ==>gravatarId=https://secure.gravatar.com/avatar/fb12ea6a621399613aae4d692533e067?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png
    ==>followers=57
    ==>following=12
    ==>createdAt=1257359950
    ==>name=Marko A. Rodriguez
    ==>login=okram
    ==>fullname=Marko A. Rodriguez
    ==>gitHubId=148925
    ==>sys_events_added=1335918859
    ==>user_type=User
    ==>totalPrivateRepoCount=0
    ==>private_gist_count=0
    ==>sys_last_full_update=1335918850
    ==>biography=graph algebra, digital librarianship, computational eudaemonics, graph theory, network science, government architecture, network metrics, decision support systems, computational social choice theory, social networks, scientometrics, collective intelligence, semantic networks, ontologies, bibliometrics, information science, swarm intelligence, information markets, peer-review process, computational sociology, knowledge engineering, computer architecture, programming languages, theoretical computing, psychometrics, multi-relational graphs, knowledge representation, reasoning, neural networks, multi-valued logic, neural growth algorithms, recommendation algorithms, distributed computing, ethics.
    ==>diskUsage=0
    ==>url=https://api.github.com/users/okram
    ==>public_gist_count=14
    ==>collaborators=0
    ==>email=marko@markorodriguez.com
    ==>sys_created_at=1335918699
    ==>ownedPrivateRepoCount=0
    ==>public_repo_count=0


The values output by `marko.map()` are the properties of the vertex
that represents Marko in the database. With the exception of the
properties that being with `sys_`, which were added by
[GitMiner][gitminer] when the data were imported, all of the other
properties are obtained directly from the [GitHub API][ghapi].

In a similar vein we can get the vertex that represents Gremlin using
the following commands:

    :::groovy
    gremlin> gremlin = g.idx("repo-idx").get("reponame", "tinkerpop/gremlin").next()
    ==>v[673]
    gremlin> gremlin.map()
    ==>openIssues=17
    ==>isFork=false
    ==>sshUrl=git@github.com:tinkerpop/gremlin.git
    ==>pushedAt=1335827022
    ==>sys_last_updated=1335929775
    ==>type=REPOSITORY
    ==>masterBranch=master
    ==>htmlUrl=https://github.com/tinkerpop/gremlin
    ==>hasIssues=true
    ==>isPrivate=false
    ==>createdAt=1258695334
    ==>description=A Graph Traversal Language
    ==>name=gremlin
    ==>cloneUrl=https://github.com/tinkerpop/gremlin.git
    ==>gitUrl=git://github.com/tinkerpop/gremlin.git
    ==>fullname=tinkerpop/gremlin
    ==>watchers=600
    ==>gitHubId=379199
    ==>svnUrl=https://github.com/tinkerpop/gremlin
    ==>homepage=http://gremlin.tinkerpop.com
    ==>url=https://api.github.com/repos/tinkerpop/gremlin
    ==>size=341021
    ==>updatedAt=1335827026
    ==>forks=30
    ==>sys_created_at=1335918734
    ==>hasDownloads=true
    ==>language=Java
    ==>reponame=tinkerpop/gremlin
    ==>hasWiki=true


While this provides a lot of information about individual vertices in
the database, it doesn't provide information about how projects or
people are related. We get at this information by looking at the edges
connected to a vertex. Within databases such as Neo4j and OrientDB
edges are directed and always got from a single source node to a
single target node. This query will iterate over all of the outgoing
edges from Marko and count up their types.

    :::groovy
    gremlin> m = [:]
    gremlin> marko.outE.label.groupCount(m).iterate(); null
    ==>null
    gremlin> m.sort{a,b -> a.value <=> b.value}
    ==>EMAIL=1
    ==>ORGANIZATION_MEMBER=1
    ==>GRAVATAR=1
    ==>ISSUE_ASSIGNEE=9
    ==>FOLLOWING=12
    ==>REPO_WATCHED=34
    ==>PULLREQUEST_COMMENT_OWNER=37
    ==>FOLLOWER=57
    ==>USER_EVENT=300
    ==>ISSUE_OWNER=404
    ==>ISSUE_COMMENT_OWNER=639
    ==>ISSUE_EVENT_ACTOR=700


There are a lot of types of edges in the database (see [EdgeType.java
in the project source][edgetype] for the complete list). In this case
we'll focus on the project social network, which is shown through the
`FOLLOWING` and `FOLLOWER` relationships. At the time of data pull
Marko was following 12 people and had 57 followers.

Likewise, we can do a similar query for incoming edges:

    :::groovy
    gremlin> m = [:]
    gremlin> marko.inE.label.groupCount(m).iterate(); null
    ==>null
    gremlin> m.sort{a,b -> a.value <=> b.value}
    ==>REPO_CONTRIBUTOR=6
    ==>FOLLOWER=9
    ==>EVENT_FOLLOW_USER=14
    ==>PULLREQUEST_MERGED_BY=27
    ==>FOLLOWING=41


When we reverse the direction and look at incoming edges these numbers
differ, and it shows that there are only nine people that Marko is a
follower of and 41 people that Marko is following. The difference in
these values is because the data only contains the sample of people
around the Tinkerpop projects. Thus, we can see that there are
57-41=16 people that are following Marko that don't show up in the
data. This is because they don't have activity, such as creating
issues, commenting on issues, or watching a repository, that would
pick them up in our sample. We know they exist, but we don't have much
information about them.

Your First Graph Traversal
===================

Now that you've gotten a feel for getting information about a single
vertex in graph, it's time to do a simple traversal. To start with,
lets get the names of all of the contributors to gremlin.

    :::groovy
    gremlin> gremlin.out('REPO_CONTRIBUTOR').login
    ==>pauljackson
    ==>espeed
    ==>spmallette
    ==>invalid-email-address
    ==>joshsh
    ==>jramsdale
    ==>NQuinn
    ==>peterneubauer
    ==>tinkerpop
    ==>zcox
    ==>xedin
    ==>okram


This query starts with the Gremlin vertex we identified before and
then follows all edges labeled `REPO_CONTRIBUTOR` which is GitHub's
way of saying someone has code in the project repository. Once we've
followed all of those edges we can fetch the login name of the users.

In a similar vein, we can get the name of all of the projects that
Marko has contributed to using the following query:

    :::groovy
    gremlin> marko.in('REPO_CONTRIBUTOR').fullname
    ==>tinkerpop/rexster
    ==>tinkerpop/furnace
    ==>tinkerpop/gremlin
    ==>tinkerpop/pipes
    ==>tinkerpop/blueprints
    ==>tinkerpop/frames


Now, we can put the two together. Our first query got a list of all of
the people who contributed to Gremlin. Let's take it step further and
get the list of all of the people who have contributed to projects
that Marko has contributed to.

    :::groovy
    gremlin> marko.in('REPO_CONTRIBUTOR').out('REPO_CONTRIBUTOR').login
    ==>joshsh
    ==>jordanlewis
    ==>okram
    ==>spmallette
    [ OUTPUT TRUNCATED FOR BREVITY ]


This, however shows many people multiples. Let's just count how many
times each name appears and then sort the list. This will give a rough
idea of the people that Marko works closest to.

    :::groovy
    gremlin> m = [:]
    gremlin> marko.in('REPO_CONTRIBUTOR').out('REPO_CONTRIBUTOR').login.groupCount(m).iterate();
    null
    ==>null
    gremlin> m.sort{a,b -> a.value <=> b.value}
    ==>espeed=1
    ==>invalid-email-address=1
    ==>NQuinn=1
    ==>zcox=1
    ==>xedin=1
    ==>svzdvd=1
    ==>jtakakura=1
    ==>sgomezvillamor=1
    ==>fescale-AC=1
    ==>hendrens=1
    ==>countvajhula=1
    ==>tor5=1
    ==>pierredewilde=1
    ==>lvca=1
    ==>alexaverbuch=1
    ==>dmitriid=1
    ==>jordanlewis=2
    ==>pauljackson=2
    ==>peterneubauer=2
    ==>tinkerpop=2
    ==>spmallette=3
    ==>joshsh=4
    ==>jramsdale=4
    ==>okram=6


Taking this a step forward, lets look at what other projects people in
this set watch. We need to branch out another layer, but first we need
to be careful and add in a `dedup()` in the pipe to ensure that we're
not counting some projects too often.

    :::groovy
    gremlin> m = [:];
    gremlin> marko.in('REPO_CONTRIBUTOR').out('REPO_CONTRIBUTOR').dedup().out('REPO_WATCHED').fullname.groupCount(m).iterate(); null
    ==>null
    gremlin> m.sort{a,b -> a.value <=> b.value }
    [ OUTPUT TRUNCATED FOR BREVITY ]
    ==>tong/hxmpp.lop=3
    ==>twitter/flockdb=3
    ==>twitter/gizzard=3
    ==>banker/mongulator=3
    ==>dgreco/graphbase=3
    ==>espeed/bulbs=4
    ==>tinkerpop/tinkubator=4
    ==>nerlo/nerlo=4
    ==>nathanmarz/storm=4
    ==>neo4j/community=5
    ==>tinkerpop/furnace=6
    ==>tinkerpop/frames=6
    ==>tinkerpop/rexster=8
    ==>tinkerpop/pipes=9
    ==>tinkerpop/gremlin=11
    ==>tinkerpop/blueprints=18


It's no surprise that the projects in the tinkerpop stack are the most
watched projects among the developers who work on Tinkerpop
projects. However, there are a few other interesting pieces of
software the seem popular. Among others [Storm][storm] is a realtime computation
system written in Java and Clojure that's great for munging through
thousands of logs. [Bulbs][bulbs] is a nifty python interface to many
of graph databases. [Nerlo][nerlo] is a mechanism to use Neo4j
from within Erlang. My apologies if my descriptions are wrong, as some
of these projects are new to me too.

That's enough about traversals in the data for now. I'll leave to
explore the data on your own. In future articles I'll cover more about
actually mining the relationships.

Exporting a Graph to GraphML
=====================

While graph databases and Gremlin are very useful for storing your
data and doing traversals on data, they're not always well structured
for doing computation on the data and gaining insight over a wide
number of projects. In grad school I studied with [one of the leaders
in the field of social network analysis][carley], and now that she's
given me a hammer, it seems like everything looks like a nail. In this
section I describe how to get your data out of a graph database and
into a program like R.

A common interchange format for social network data is in the GraphML
format - an XML specification for describing graphs. It was first used
by individuals interested in visualizing large scale graphs. As such,
it has significant drawbacks that make it less than ideal compared to
other formats such as DynetML (e.g. on a single graph, no nesting,
edges must all be directed or undirected). In any case, it's what we
have, so we'll use it. Fortunately, both Gremlin and the igraph
package for R, which we'll be using later, support GraphML.

I've created a simple script that you can run in your current Gremlin
session. You should be able to just paste this code into your running
gremlin session and it will save the network to file called
`follower.graphml`.

<!-- GitHub Gist: 2690667 -->
<!-- Filename: "graphmlExport.groovy" -->
<script src="https://gist.github.com/2690667.js"></script>

The astute observer will notice a couple of things about this. First,
we're using a specialized method to get all of the users associated
with the Gremlin project on GitHub. However, we're not following all
of the ways a user can be associated. For example, we're not looking a
issues, pull requests, commits, or other events.

Secondly, we're skipping a lot of edges and vertices. In this case
we're skipping every edge that doesn't lead to a user in this set. The
reason for that is because if we didn't skip these edges we'd have a
network with 30,000+ nodes as opposed to to the 606 in this
network. While it's possible to do analysis on networks of that size,
it is much slower and would prove to be a bit of a distraction here.

<div class="image caption center">
    <img src="/weblog/media/2012/05/gremlinNetwork.png" alt="Network as visualized in Cytoscape">
    <p>Network as visualized in Cytoscape</p>
</div>

This finishes the section of the article dealing with gremlin from the
command line. From here on out the operations are done in R.

** Very Important: ** Before exiting Gremlin run the command
`g.shutdown()` to close the graph database. If you don't do this
then you'll have to wait for a recovery process then next time you
look at the data.

Examining the Data in R
================

Within R the first thing to do is to make sure you have the igraph
package installed. You can do this by running the following command
and following the directions:

    :::r
    install.packages('igraph')


Now that we've got igraph installed, it's time to have some
fun. First, we need to tell R to use the functions inside of the
igraph library and to load our data.

    :::r
    library(igraph)
    setwd("~/gremlin")
    graph <- read.graph("follower.graphml", format="graphml")


First let's get some summary information. This can be done with the
`ecount` and `vcount` functions. It shows that in the current network
there are 510 edges and 606 nodes.

    :::r
    > ecount(graph)
    [1] 510
    > vcount(graph)
    [1] 606


This network has a lot of isolates in it. That's somewhat to be
expected as not every user utilizes the follower feature of
github. The following commands will remove isolates from our data set
and results in a network of 236 vertices and 510 edges.

    :::r
    > isolates <- which(degree(graph, mode = 'all') == 0) - 1
    > graph <- delete.vertices(graph, isolates)
    > summary(graph)
    Vertices: 236
    Edges: 510
    Directed: TRUE
    No graph attributes.
    Vertex attributes: location, sys_last_updated, type, blog, gravatarId, following, followers, createdAt, name, login, fullname, gitHubId, sys_events_added, user_type, totalPrivateRepoCount, private_gist_count, biography, sys_last_full_update, diskUsage, url, public_gist_count, collaborators, email, sys_created_at, company, ownedPrivateRepoCount, public_repo_count, id.
    Edge attributes: sys_created_at, id.


First, lets get an idea of the degree of the vertices in the
graph. This command creates a histogram that clumps vertices by the
number of edges they have. We see that only a very few have many
edges, most have fewer than 10 edges. I should stress, this does not
reflect the total number of people those accounts follow, rather it
reflects only the total number of people within Gremlin that each
account follows.

    :::r
    hist(degree(graph))


<div class="image caption center">
    <img src="/weblog/media/2012/05/degreeHistogram.png">
    <p></p>
</div>

Now, lets look a couple of the classic centrality
measures. Betweenness centrality calculates the proportion of all
shortest paths between vertices that a particular vertex sits on. If
communication had to go person to person and could only go along
connections that are established, these people would prove to be key
in the network.

    :::r
    results <- data.frame(login=get.vertex.attribute(graph, "login"))
    results$betweenness <- betweenness(graph)
    results$evcent <- evcent(graph)$vector


Now that we've calculated those centralities, let's take a look. We'll
start with betweenness. According to this data the user that has the
most central role is [spmallette][spmallette], an active participant
in the tinkerpop communities, followed by [ahzf][ahzf], a developer
who is working on .Net ports of many blueprints services. In third
place is a research account from a university in Korea. This account
shows up all over the place and I generally consider it to be a spam
account. It follows tens of thousands users and therefore creates
artificially short paths between users, boosting it's score in the
process. In fourth place is [Marko][okram], the leader of Tinkerpop.

    :::r
    > results[order(-results$betweenness), c("login", "betweenness")][1:10, ]
             login betweenness
    165 spmallette    8415.414
    156       ahzf    8332.422
    134     hcilab    7963.272
    16       okram    6492.181
    107  igrigorik    5793.494
    235  joshbuddy    4623.192
    87      collin    3305.313
    172   pangloss    2442.794
    219   stonegao    2165.359
    60        dann    1876.813


In the betweenness centrality model, which is a directed model, users
who follow few additional users are penalized. As Marko only follows a
handful of users, his score is low, despite the fact that many people
in the community follow him.

However, when we use eigenvector centrality, which is a more robust
centrality metric, is used, we find a more interesting picture. [Marko][okram]
and [peterneubauer][peterneubauer] are the top individuals, followed by [spmallette][spmallette] and
[joshsh][joshsh], additional developers of Tinkerpop.

    :::r
    > results[order(-results$evcent), c("login", "evcent")][1:10, ]
                login    evcent
    16          okram 1.0000000
    167 peterneubauer 0.9739565
    165    spmallette 0.6607181
    13         joshsh 0.5872818
    107     igrigorik 0.5665205
    226         thobe 0.5273195
    219      stonegao 0.5220129
    14   alexaverbuch 0.5173995
    178       nawroth 0.4466164
    156          ahzf 0.4284547


There's always more that you can do with these tools, and in the
future I'll discuss some more, but for now I hope this has given you a
taste for how to mine social networks from GitHub. Enjoy!

[gh]: http://www.github.com/
[sf]: http://www.sourceforge.net/
[gc]: http://code.google.com/
[bb]: http://www.bitbucket.org/
[tp]: http://www.tinkerpop.com/
[bt]: http://research.google.com/archive/bigtable.html
[mongo]: http://www.mongodb.org/
[mc]: http://memcached.org/
[neo4j]: http://www.neo4j.org/
[orientdb]: http://www.orientechnologies.com/orient-db.htm
[trinity]: http://research.microsoft.com/en-us/projects/trinity/
[infinitegraph]: http://www.infinitegraph.com/
[dex]: http://www.sparsity-technologies.com/dex
[wikipedia]: http://en.wikipedia.org/wiki/Graph_database
[pipes]: https://github.com/tinkerpop/pipes
[blueprints]: https://github.com/tinkerpop/blueprints
[gremlin]: https://github.com/tinkerpop/gremlin
[frames]: https://github.com/tinkerpop/frames
[rexster]: https://github.com/tinkerpop/rexster
[furnace]: https://github.com/tinkerpop/furnace
[r]: http://www.r-project.org/
[ess]: http://ess.r-project.org/
[statet]: http://www.walware.de/goto/statet
[rstudio]: http://rstudio.org/
[rstudiodownload]: http://rstudio.org/download/desktop
[gremlindocs]: https://github.com/tinkerpop/gremlin/wiki
[maven]: http://maven.apache.org/
[tinkerpopgraph]: https://docs.google.com/open?id=0B43zbOfTSOoUZXQydlhGOW1kUHc
[tinkerpopneo4j]: https://docs.google.com/folder/d/0B43zbOfTSOoUZXQydlhGOW1kUHc/edit?docId=0B43zbOfTSOoUOWF6NjZNVnUtN2s
[emailme]: mailto:patrick@wagstrom.net
[ghapi]: http://api.github.com/
[gitminer]: https://github.com/pridkett/gitminer
[storm]: https://github.com/nathanmarz/storm#readme
[bulbs]: https://github.com/espeed/bulbs
[nerlo]: https://github.com/nerlo/nerlo
[carley]: http://www.casos.cs.cmu.edu/bios/carley/carley.html
[peterneubauer]: https://github.com/peterneubauser
[joshsh]: https://github.com/joshsh
[spmallette]: https://github.com/spmallette
[ahzf]: https://github.com/ahzf
[okram]: https://github.com/okram