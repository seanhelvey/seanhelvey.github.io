---
layout: post
title:  "Rails without sudo"
date:  2019-03-07
permalink: /:title/
---

The installation process is an unfortunate stumbling block for many people learning Ruby on Rails. While it is easy to get going, it is also too easy to end up using `sudo` to install various things as root along the way. I remember this being annoying for me 7 years ago, and revisiting the framework today, it does not seem like much had changed. Hopefully these steps will help!

1. Follow the [installation instructions](https://github.com/rbenv/rbenv#installation) for `rbenv`
1. Before installing bundler or rails, run `rbenv global <version>` where `<version>` is the latest stable version of Ruby, and `rbenv rehash` to make sure it is being used. 
1. Now when you run `gem install rails` and `rails new` you should not be prompted to run any commands using `sudo`.

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2019/Yay.png" target="_blank"><img alt="todo" class=" lazyloaded" src="/assets/images/seanhelvey/2019/Yay.png">
    </a>
  <figcaption>
    Yay!
  </figcaption>
  </figure>
</div>