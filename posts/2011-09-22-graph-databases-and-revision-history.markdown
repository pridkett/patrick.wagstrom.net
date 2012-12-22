title: Graph Databases and Revision History
timestamp: 08:34 PM Thursday, September 22, 2011 EDT
status: published
slug: graph-databases-and-revision-history
tags:
- gremlin
- graphdb
- graph
- research
- infinitegraph
- orientdb
- neo4j
- history
- revision
url: /weblog/2011/09/22/graph-databases-and-revision-history/

layout: post
oldcategories:
- research
oldtags:
- graph
- graphdb
- gremlin
- history
- infinitegraph
- neo4j
- orientdb
- revision
wordpress_id: '994'

---

Graph databases such as [Neo4j](http://www.neo4j.org/), [OrientDB](http://www.orientechnologies.com/orient-db.htm), and [InifiniteGraph](http://www.infinitegraph.com/) are useful tools for social science researchers because localized queries are a function of only the number of links relative to the nodes in question. In contrast, relational databases, such as [MySQL](http://www.mysql.com/) and [PostgreSQL](http://www.postgresql.org/), suffer performance degradation as more nodes are added because of the number of entries in join tables and the computational difficulty of finding the relevant edges in the indexes.

For my own research I've been exploring some issues around Open Source software development and Twitter using graph databases, and thus far it's been very interesting. However, one thing that I haven't yet found is an easy way to maintain version history for nodes and edges. In this entry I discuss a strategy that I've found to be effective for managing revisions of items with a small number of links.

Let's assume that you have a system such as a corporate directory where each user has a set of skills that they can self-declare. For example, there may be a user who identifies himself as being an expert in LAMP stack: Linux, Apache, MySQL, and Python. This can be represented as a very simple graph:

<div class="image caption center">
    <img src="/weblog/media/2011/09/GraphRevision1.png" alt="Simple network showing relation between a user and his declared skills">
    <p>Simple network showing relation between a user and his declared skills</p>
</div>

This works very well if the only source of data about skills is the user. However, in reality information about a users skills can be obtained from a variety of other resources such as project and work item assignment, natural language processing or artifacts (tweets, email, etc), or surveys of other employees within the company. If that's the case we'll want to break the source of set of skills into a new node and link it to the user.

<div class="image caption center">
    <img src="/weblog/media/2011/09/GraphRevision2.png" alt="Connection between a user and his skills with an intermediary node to identify the source of the skills">
    <p>Connection between a user and his skills with an intermediary node to identify the source of the skills</p>
</div>

If we had multiple sources we'd just have multiple nodes similar to the cyan node labeled "User1Skills" in the diagram above. However, what happens if the user is no longer interested in Python and Apache and instead has concluded that listing Ruby is a better option for his skills? How do we store his updated set of skills? The simplest thing to do is to only look at the current set of skills and loose the data from the previous set of skills.

But that may not be ideal because there's a chance that at some point previous states could be very important. For example, what if there was another user, User2, who wrote some critical Python code then later left the company? User1 may be the only person who ever had experience with Python and throwing away this previous state may prove costly. Instead what we can do is to create a new User1Skills node and connect it to User1 with the same CURRENT_SKILLS edge, but also connect it to the previous User1Skills node with an edge labeled PREVIOUS_STATE.

<div class="image caption center">
    <img src="/weblog/media/2011/09/GraphRevision3.png" alt="Managing a single previous state of User1's skill set as shown by the PREVIOUS_STATE edge linking to the older state">
    <p>Managing a single previous state of User1's skill set as shown by the PREVIOUS_STATE edge linking to the older state</p>
</div>

This can be easily expanded when to include multiple previous states but creating new User1Skills nodes, linking it to the appropriate skills, changing the destination of the CURRENT_SKILLS link and creating a new PREVIOUS_STATE link to the old state. The advantage is that this method is essentially constant time for the number of previous states as we're just rewiring a couple of different nodes.

<div class="image caption center">
    <img src="/weblog/media/2011/09/GraphRevision4.png" alt="Multiple PREVIOUS_STATE edges and nodes can be used to indicate that there are many previous states for this user. Additions of previous states are done in constant time.">
    <p>Multiple PREVIOUS_STATE edges and nodes can be used to indicate that there are many previous states for this user. Additions of previous states are done in constant time.</p>
</div>

### Querying the Graph

We can continue like this ad infinitum for whenever we get an update of new skills. However at some point we'll need to actually traverse this graph to make use of this historic skill sets of individuals in the network. I'll talk about three different types of queries: listing all the current skills in the organization, listing User1's skills at an arbitrary time in the past, and taking a skill that is not a current skill for any user and figuring out which user had the skill in the past.

I'll demonstrate the queries using [Gremlin](https://github.com/tinkerpop/gremlin), a [Groovy](http://groovy.codehaus.org/) based domain specific language for graph traversals. If you'd like to play along at home, I've made the previous figure available as [a GraphML file that you can download](http://patrick.wagstrom.net/misc/revisions.graphml).

First, lets get started by firing up Gremlin and loading the GraphML file in to the Gremlin REPL.
    :::groovy
    $ ./gremlin.sh
             \,,,/
             (o o)
    -----oOOo-(_)-oOOo-----
    gremlin> g = new TinkerGraph() 
    ==>tinkergraph[vertices:0 edges:0]
    gremlin> reader = new GraphMLReader(g)
    ==>com.tinkerpop.blueprints.pgm.util.graphml.GraphMLReader@3ebc312f
    gremlin> reader.inputGraph(new FileInputStream("test.graphml"))
    ==>null
    gremlin> g
    ==>tinkergraph[vertices:10 edges:13]



#### Listing All Current Skills in the Organization


There are two ways to traverse to get all of the currently active skill nodes. Either we can start with each person, follow the CURRENT_SKILLS link and then SKILLS link, or we can can start with each skill and traverse backwards.

    :::groovy
    gremlin> g.V.filter{it.getProperty("type")=="PERSON"}.out("CURRENT_SKILLS").out("SKILL").title
    ==>MySQL
    ==>Rails
    ==>Ruby


Starting from the skills themselves requires a bit more logic as we'll end up with multiple paths to a person. We take advantage of Gremlin's ability to backtrack here and get the information about the actual skills.

    :::groovy
    gremlin> g.V.as("skill").filter{it.getProperty("type")=="SKILL"}.in("SKILL").in("CURRENT_SKILLS").back("skill").title
    ==>Rails
    ==>MySQL
    ==>Ruby


If we were in a more complex environment and wanted to how many times each skill appeared in the set of active skills we could use the following code which counts the number of times each skill title appears in the set:

    :::groovy
    gremlin> m = [:]; g.V.filter{it.getProperty("type")=="PERSON"}.out("CURRENT_SKILLS").out("SKILL").title.groupCount(m) >> -1; m
    ==>MySQL=1
    ==>Rails=1
    ==>Ruby=1


#### Listing User1's Skills in the Past

To list all of User1's skills at some point in the past we can first need to store when the skill sets were collected. I use a property called timestamp that includes a simple unix timestamp for when the data was collected. Within Groovy (and thus Gremlin), you can get a timestamp for a date using the following bit of code:

    :::groovy
    gremlin> formatter = new java.text.SimpleDateFormat("yyyy-MM-DD hh:mm")
    ==>java.text.SimpleDateFormat@23084c3a
    gremlin> formatter.setTimeZone(TimeZone.getTimeZone("UTC"))
    ==>null
    gremlin> formatter.parse("2011-07-04 12:00").getTime()/1000
    ==>1294099200


Within our the data set I've set the timestamp field of the SKILLSET nodes to be midnight UTC on January 1, 2011, 2010, and 2009 respectively. We can pick a date and then execute the query to get the users skill set as of that date. However, this query is a little messy and needs to utilize the [ifThenElse pipe](http://tinkerpop.com/maven2/com/tinkerpop/pipes/0.7/api/com/tinkerpop/pipes/branch/IfThenElsePipe.html) within Gremlin. The reason is because what we really need is a while loop, and the loop mechanism in Gremlin is a do loop.

    :::groovy
    gremlin> user1 = g.V.filter{it.title=="User1"}.next()
    ==>v[0]
    gremlin> sd = formatter.parse("2010-01-02 00:00").getTime() / 1000 
    ==>1262390400
    gremlin> user1.out("CURRENT_SKILLS").ifThenElse{it.getProperty("timestamp") < sd}{it}{it.as("ss").out("PREVIOUS_STATE").loop("ss"){it.object.getProperty("timestamp") > sd}}.out("SKILL").title
    ==>MySQL
    ==>Linux
    ==>Ruby


#### Finding out Which User's Currently Have the Skill or Had it in the Past

In this example we'll traverse the graph to find the users who at one point in time had the Python skill. As before, because Gremlin only has a do loop and not a while loop, we need to do the crazy ifThenElse condition to check the initial condition. By artfully removing the ifThenElse we can eliminate the condition when a user currently has the skill and only list users who had the skill appear in a previous update.

    :::groovy
    gremlin> skill = g.V.filter{it.title=="Python"}.next()
    ==>v[12]
    gremlin> skill.in("SKILL").ifThenElse{it.inE("CURRENT_SKILLS").hasNext()}{it}{it.as("ss").in("PREVIOUS_STATE").loop("ss"){!it.object.inE("CURRENT_SKILLS").hasNext()}}.in("CURRENT_SKILLS").title.unique()
    ==>User1


### Drawbacks and Limitations to the Method

There are some notable drawbacks to this method. The most notable and obvious is how messy some of these graph traversals are because of the need to use ifThenElse pipes. Fortunately, after pinging people on the Gremlin list it seems as though they're amenable to creating different types of pipes include a while pipe.

The other issue is that this mechanism doesn't work well for a situation such as [Twitter](http:/www.twitter.com/). In a system like Twitter where each user can have hundreds or thousands outgoing links this will create a huge number of extra edges that aren't actually active but slow down the traversals. Perhaps a better way to handle these links is to add properties to the edges that indicate when the edge was added or removed. I'll try to address these in a future post.

Do you have any suggestions for how to handle revisions in a graph database? Leave them here and maybe we can up with a great solution.
