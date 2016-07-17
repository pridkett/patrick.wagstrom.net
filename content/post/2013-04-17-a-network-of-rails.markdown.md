---
comments: true
date: '2013-04-17T09:04:00-04:00'
old:
  layout: post
  status: published
  timestamp: 09:04 AM Wednesday, April 17, 2013 EDT
slug: a-network-of-rails
tags:
- research
- rails
- data
- gitminer
- github
title: New Paper&#x3a; A Network of Rails&#x3a; A Graph Dataset of Ruby on Rails and
  Associated Projects
url: /weblog/2013/04/17/a-network-of-rails/
---

For the last year and a half I've been working with Anita Sarma, a professor at the University of Nebraska, Lincoln and her graduate student, Corey Jergensen, to try and understand some of the social dynamics around GitHub. As we began to dig at the ecosystem we realized that we had an opportunity to perform some novel analysis on the community. Specifically, GitHub is a highly networked ecosystem and most of the queries that we were doing were localized around single projects or developers. At this time graph databases were taking off so we decided to learn a new technology while getting some data at the same time.

This resulted in the creation of [GitMiner][GitMiner], a tool that utilizes the GitHub APIs to download all the data about a project and it's related users, issues, pull requests, and basically everything else that you can get out of the API. It then stores this information inside of a graph database - something that I've written about before when I first published [a dataset on the Tinkerpop family of projects][tinkerpop-data].

Now we've had a chance to formally publish a larger set of data, thousands of projects associated with Ruby on Rails. The data are published in this years [conference on Mining Software Repositories][msr2013]. If you'd like to read the actual paper, here's [the authors' pre-print of the paper][msr2013preprint] and [the GitHub repository with the actual data][rails-ghrepo].

In the coming weeks/months I'll probably write more about how to use GitMiner to collect large amounts of data from GitHub and how to crawl this data. For the interim, however, I'll leave you with this nifty picture of shared developers between projects, which is part of an upcoming submission of ours.

<div class="image caption center">
	<a href="/weblog/media/2013/04/rails-network.png"><img src="/weblog/media/2013/04/rails-network-thumb.png" width="800" height="573"></a>
	<p>Developers shared between projects in our Ruby on Rails dataset. The size of nodes represents the number of developers on the project, edge width is the number of shared developers between projects, and color represents programming language. [<a href="/weblog/media/2013/04/rails-network.png">link to full size image</a>]</p>
</div>

**Citation:** Wagstrom, P., Jergensen, C., and Sarma, A. *[A Network of Rails: A Graph Dataset of Ruby on Rails and Associated Projects][msr2013preprint]*. Proceedings of the 2013 Working Conference on Mining Software Repositories, ACM (2013).


[GitMiner]: https://github.com/pridkett/gitminer
[tinkerpop-data]: /weblog/2012/05/13/mining-github-followers-in-tinkerpop/
[msr2013]: http://2013.msrconf.org/
[msr2013preprint]: http://academic.patrick.wagstrom.net/publications/Wagstrom_2013_ANetworkOfRails.pdf?attredirects=0
[rails-ghrepo]: https://github.com/pridkett/gitminer-data-rails