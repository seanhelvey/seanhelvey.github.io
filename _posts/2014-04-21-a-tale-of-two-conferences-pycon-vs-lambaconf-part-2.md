---
id: 596
title: 'A Tale of Two Conferences &#8211; PyCon vs. LambaConf (Part 2)'
date: 2014-04-21T01:28:59+00:00
author: Sean
layout: post
guid: http://www.seanhelvey.com/?p=596
permalink: /a-tale-of-two-conferences-pycon-vs-lambaconf-part-2/
categories:
  - Community
  - Life
  - Technology
---
So, what is the problem? Python is easy enough to read that Guido was able to debug his program in a matter of seconds during his keynote. If it were a large system with several dozen developers though, it would surely be more difficult to write tests and prevent errors from occurring. While Python is strongly typed, it is a <a title="dynamic programming language" href="http://en.wikipedia.org/wiki/Dynamic_programming_language" target="_blank">dynamic programming language</a>, meaning these checks happen at runtime instead of during compilation.

<div id="attachment_598" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://twitter.com/boia01/status/457517653582557185/photo/1"><img class="wp-image-598 size-medium" src="/assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-11.07.20-AM-300x227.png" alt="Thanks to Alex Boisvert for the image." width="300" height="227" srcset="/assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-11.07.20-AM-300x227.png 300w, /assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-11.07.20-AM.png 907w" sizes="(max-width: 300px) 100vw, 300px" /></a>

  <p class="wp-caption-text">
    Thanks to Alex Boisvert for the image.
  </p>
</div>

If you have ever had the pleasure of seeing <a title="Paul Phillips" href="https://twitter.com/extempore2" target="_blank">Paul Phillips</a> speak, then you can imagine where this is heading. He explained that all of our feeble languages and their syntax are distractions from the underlying <a title="abstract syntax tree" href="http://en.wikipedia.org/wiki/Abstract_syntax_tree" target="_blank">abstract syntax tree</a>, which deserves more focus. He also went on to describe the current state of programming as a &#8220;public health crisis&#8221; due to the massive amount of time and energy spent waiting for code to compile.

What Paul seems to want is a more efficient system of incremental compilation which will improve the experience of programming. However, in the meanwhile, he and the rest of the functional programming community are willing to wait. Why?

> Python has the notion of &#8220;duck typing&#8221;, meaning &#8220;If it walks and talks like a duck, it&#8217;s a duck!&#8221;. You could argue that Haskell has a much better form of duck typing. If a value walks and talks like a duck, then it will be considered a duck through type inference, but unlike Python the compiler will also catch errors if later on it tries to bray like a donkey! &#8211; <a title="Why Haskell matters" href="http://www.haskell.org/haskellwiki/Why_Haskell_matters" target="_blank">Why Haskell Matters</a>

While type safety can help us prevent bugs from occurring at runtime, a purely functional language has no side-effects, which are arguably a much more significant source of bugs in large systems. But wait a minute&#8230; Aren&#8217;t computers essentially state machines? No matter how pure or functional our code is, it will always be translated into instructions with loops and states in assembly, right?

I associate functional programming with Lambda Calculus and imperative programming with the Turing machine. Since they are <a title="equivalent models of computation" href="http://en.wikipedia.org/wiki/Church%E2%80%93Turing_thesis" target="_blank">equivalent models of computation</a>, I have a hard time understanding why functional programming is qualitatively better than other paradigms and how this is related to type systems and compilation.

It turns out that in this case, style matters. Catching bugs upstream by restricting side-effects and ensuring type safety during compilation is clearly more efficient in terms of programmer time than trying to detect problems with testing at runtime.

[<img class="aligncenter wp-image-629" src="/assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-7.06.06-PM.png" alt="Screen Shot 2014-04-20 at 7.06.06 PM" width="500" height="91" srcset="/assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-7.06.06-PM.png 729w, /assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-7.06.06-PM-300x54.png 300w" sizes="(max-width: 500px) 100vw, 500px" />](/assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-7.06.06-PM.png)

[<img class="aligncenter wp-image-639" src="/assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-7.20.02-PM.png" alt="Screen Shot 2014-04-20 at 7.20.02 PM" width="500" height="86" srcset="/assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-7.20.02-PM.png 707w, /assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-7.20.02-PM-300x51.png 300w" sizes="(max-width: 500px) 100vw, 500px" />](/assets/images/seanhelvey/2014/04/Screen-Shot-2014-04-20-at-7.20.02-PM.png)

Huge thanks to <a title="@nuttycom" href="https://twitter.com/nuttycom" target="_blank">@nuttycom</a>, <a title="@puffnfresh" href="https://twitter.com/puffnfresh" target="_blank">@puffnfresh</a>, <a title="@DataRiot" href="https://twitter.com/DataRiot" target="_blank">@datariot</a>, <a title="@NathanLubchenco" href="https://twitter.com/NathanLubchenco" target="_blank">@nathanlubchenco</a>, and <a title="@dchenbecker" href="https://twitter.com/dchenbecker" target="_blank">@dchenbecker</a>. The big data team at Simple Energy is always drilling home the importance of type safety and helping mere mortals like myself understand the state explosion that takes place in large systems that aren&#8217;t written functionally. They are thought leaders in their community and just awesome people to be around.

&nbsp;