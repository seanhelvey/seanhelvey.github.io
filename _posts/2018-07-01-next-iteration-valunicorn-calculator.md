---
layout: post
title:  "Next Iteration of Valunicorn Calculator"
date:  2018-07-01
permalink: /:title/
---

> "The goal is two-fold: level-up my Elm skills by continuing to maintain and develop a more complex application and add features to a project which people can use to invest sustainably."

I've been working on the value investing newsletter [Valunicorn](http://www.valunicorn.me/) since January of 2015. I began developing a [dividend calculator](http://www.valunicorn.me/calculator.html) during 2016 using the programming language Elm. Currently you can use the calculator to see what $1,000 would be worth assuming dividend growth stays constant and dividends are reinvested over a period of time.

<div class="sean-blog-image">
  <figure>
    <a href="http://www.valunicorn.me/calculator.html" target="_blank"><img alt="todo" class=" lazyloaded" src="/assets/images/seanhelvey/2018/calculator.png">
    </a>
  <figcaption>
    The Valunicorn Calculator
  </figcaption>
  </figure>
</div>

With 100 commits in [GitHub](https://github.com/seanhelvey/valunicorn) up to this point, I am about to embark on the next iteration of the calculator. The goal is two-fold: level-up my Elm skills by continuing to maintain and develop a more complex application and add features to a project which people can use to invest sustainably.

# Objectives
I have received a ton of great input on this project over the last couple of years. The most exciting so far has resulted in coverage of sustainable listings, the first of which is 3M (MMM). I'm outlining some objectives for the next iteration here to keep myself accountable and provide visibility:

* Chores
  * Testing - The core calculator functionality will be more thoroughly tested.
  * Upgrade - Elm 0.19 will be adopted once it has been released.

* Bug fixes
  * Rounding - Floats will be properly rounded and displayed while hovering over the chart.
  * Y-axis display - This axis will no longer be truncated for large outputs.

* New features
  * Custom stocks - Subscribers will be able to use the calculator with any stock, not just those selected by Valunicorn.
  * Custom portfolios - The ability to adjust the input holding amount and calculate the future value for an entire portfolio of holdings rather than one individual stock.

# Gratitude
To the supportive Elm community, our local [Front Range Elm Meetup](https://www.meetup.com/Front-range-elm/), Pivotal Labs for sponsoring that group, and the [Northern Colorado Value Investing Meetup](https://www.meetup.com/Northern-Colorado-Value-Investing-Meetup/).