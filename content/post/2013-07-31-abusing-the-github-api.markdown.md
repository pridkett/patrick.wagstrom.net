---
comments: true
date: '2013-07-31T11:26:00-04:00'
old:
  layout: post
  status: published
  timestamp: 11:26 AM Wednesday, July 31, 2013 EDT
slug: abusing-the-github-api
tags:
- research
- github
- graph
- gitminer
- data
title: 'Recent Talk: Abusing the GitHub API and Graph Databases to Gain Insight About
  Your Project'
url: /weblog/2013/07/31/abusing-the-github-api/
---

Last night I, along with a lot of other amazing folks, gave a lightning talk at the Data Science DC meetup. In addition to talks about being a "growth hacker", random forests, consensus clustering, and "If you give a nerd a number", there was my humble talk about GitHub, Graph Databases, and gaining insight about the social aspects of your project.

<iframe src="https://docs.google.com/presentation/d/1zsql-8WPX52tB_ghxxDYga-_bKQESZKcCzjpl-qmO7s/embed?start=false&loop=false&delayms=3000" frameborder="0" width="480" height="389" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

In short, I did an exploration of the [Julia programming language][julia] using my tool, [GitMiner][GitMiner], to evaluate the social aspects of the community around the language. I was pleased when I saw that one of the foremost influencers of Julia, at least when measured by watched repositories was [Data Community DC's][dcdc] own [Harlan Harris][harlan]. I promise I didn't plan that, but it made for a little more interesting of a story.

For folks that are interested, I've posted the [code that I used for the analysis as a GitHub repository][dsdc-gitminer]. Feel free to check it out, fork it, or do whatever you want with it - under the terms of the MIT license, of course.

[julia]: http://julialang.org/
[gitminer]: https://github.com/pridkett/gitminer/
[dsdc-gitminer]: https://github.com/pridkett/dsdc-gitminer
[harlan]: http://www.harlan.harris.name/
[dcdc]: http://datacommunitydc.org/blog/