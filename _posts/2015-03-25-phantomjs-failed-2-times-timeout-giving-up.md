---
id: 862
title: PhantomJS failed 2 times (timeout). Giving up.
date: 2015-03-25T01:51:11+00:00
author: Sean
layout: post
guid: http://www.seanhelvey.com/?p=862
permalink: /phantomjs-failed-2-times-timeout-giving-up/
categories:
  - Libraries and Frameworks
  - Technology
tags:
  - JavaScript
  - Karma
  - Node
  - Node.js
  - PhantomJS
---
Giving up? There is no giving up in Node.js! Come on..

> Running &#8220;karma:unit&#8221; (karma) task
  
> ERROR [launcher]: PhantomJS failed 2 times (timeout). Giving up.
  
> Warning: Task &#8220;karma:unit&#8221; failed. Use &#8211;force to continue.

Scouring over Stack Overflow has gotten you nowhere. Your pals on IRC haven&#8217;t come up with a solution either. You have blown away your whole Node environment, upgraded certain dependencies, and downgraded other packages. What is the solution?

> <p class="p1">
>   nvm install 0.12.0<br /> nvm use 0.12.0
> </p>

<p class="p1">
  Looks like certain versions of Node.js prior to 0.12.0 caused issues between Karma and PhantomJS. Upgrade to the latest stable version and you should be good to go.
</p>