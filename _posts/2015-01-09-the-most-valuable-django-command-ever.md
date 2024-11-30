---
id: 794
title: The Most Valuable Django Command Ever
date: 2015-01-09T17:21:49+00:00
author: Sean
layout: post
guid: http://www.seanhelvey.com/?p=794
permalink: /the-most-valuable-django-command-ever/
categories:
  - Libraries and Frameworks
  - Technology
tags:
  - Debugging
  - Django
  - ipdb
  - pdb
  - PostgreSQL
  - ProgrammingError
  - Solution
  - SQLite
  - Threading
---
There you are, debugging using pdb or ipdb, trying to ship the latest build of an important project. You are running PostgreSQL, yet a pesky SQLite error continues to interrupt your workflow:

> ProgrammingError: SQLite objects created in a thread can only be used in that same thread.

You have tried everything! Googling indicates that there is no shortage of Pythonistas out there who have experienced the same problem, but no solution is available.

<div id="attachment_795" style="width: 310px" class="wp-caption aligncenter">
  <a href="/assets/images/seanhelvey/2015/01/Pop_Quiz_Hot_Shot.jpeg.CROP_.promovar-mediumlarge.jpeg"><img class="size-medium wp-image-795" src="/assets/images/seanhelvey/2015/01/Pop_Quiz_Hot_Shot.jpeg.CROP_.promovar-mediumlarge-300x127.jpeg" alt="What do you do? What do you do?" width="300" height="127" srcset="/assets/images/seanhelvey/2015/01/Pop_Quiz_Hot_Shot.jpeg.CROP_.promovar-mediumlarge-300x127.jpeg 300w, /assets/images/seanhelvey/2015/01/Pop_Quiz_Hot_Shot.jpeg.CROP_.promovar-mediumlarge.jpeg 590w" sizes="(max-width: 300px) 100vw, 300px" /></a>

  <p class="wp-caption-text">
    What do you do? What do you do?
  </p>
</div>

I&#8217;ll tell you what you do! You run your server without threading. That is the solution. I don&#8217;t understand why Django seems to think SQLite is running when you are using PostgreSQL, but the following command will allow you to circumvent the issue and continue with your work.

> <p class="p1">
>   python manage.py runserver &#8211;nothreading
> </p>

<p class="p1">
  Happy coding!
</p>