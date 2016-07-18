---
comments: true
date: '2016-07-17T21:00:00-05:00'
slug: migration-to-hugo
tags:
- meta
- hugo
- weblog
- docker
title: Migrated Blog to Hugo
url: /weblog/2016/07/17/migration-to-hugo/
---

Hey world, long time no blog. Last time I wrote an article I had barely moved
to Connecticut and [IBM Watson Group](http://www.ibmwatson.com/) didn't even
exist yet.  Anyway, I've taken some time to do two major changes to my website.
First, I've migrated everything over to [Hugo](https://gohugo.io). As I get
more content this becomes less and less trivial, but Hugo seems like it's a
great balance between usability and performance. I've also refactored my
personal website to run my web pages through a series of docker containers. The
notable thing about that change is that it now has a nginx http/2.0 capable
frontend that is proxying traffic to containers on the backend. It's all
running through Docker.

I've also published the source code for both these containers and my personal
website. As you might expect, you can find them both on GitHub:

* [patrick.wagstrom.net](https://github.com/pridkett/patrick.wagstrom.net): the
  complete source code to everything required to make this website using Hugo
* [webpage-docker-containers](https://github.com/pridkett/webpage-docker-containers):
  two different docker containers used to run this website. Eventually I should break
  the nginx frontend proxy out to it's own container and publish it in the primary
  docker repository.

I'm certain that there still are a few little nits and issues with the website.
Mainly around the fact that this webpage has been evolving for the last sixteen
years (nineteen if you count time time before it was at patrick.wagstrom.net).
That means there are a lot of old web crawlers out there that are looking for
content that just isn't there anymore.
