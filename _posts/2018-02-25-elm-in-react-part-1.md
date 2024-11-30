---
layout: post
title:  "Elm in React Part #1"
date:  2018-02-25-elm-in-react-part-1.md
permalink: /:title/
---

This post will expand upon [Evan's post](http://elm-lang.org/blog/how-to-use-elm-at-work) describing how to use Elm with React. I've been using [this todo list example](https://github.com/seanhelvey/react-intro-exercise) to teach react for a while now (thanks [Chad](https://twitter.com/chadwithuhc)!) so I thought it would make sense to use the same example here. Checkout the Elm branch of the todo list repo linked above if you want to follow along. You can see the whole commit diff for this blog post [here](https://github.com/seanhelvey/react-intro-exercise/commit/2fcb2ddb9db4b3bb655312a4df1b5dc2d1c88a6d).

We need to do a few things to add Elm into our react app:
1. Npm install `elm-webpack-loader` and `react-elm-components`
2. Update Webpack config
3. Install Elm packages (and add elm-stuff to .gitignore)
4. Replace React component with Elm

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2018/todo.png" target="_blank"><img alt="todo" class=" lazyloaded" src="/assets/images/seanhelvey/2018/todo.png">
    </a>
  <figcaption>
    A simple todo list
  </figcaption>
  </figure>
</div>

### Step 1 - Npm install
Step one above doesn't need explaining, but I'll describe steps 2-4 in more detail.

### Step 2 - Update Webpack config

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2018/webpack.png" target="_blank"><img alt="webpack" class=" lazyloaded" src="/assets/images/seanhelvey/2018/webpack.png">
    </a>
  <figcaption>
    Add the elm-webpack-loader and noParse lines. Note that the syntax has changed so that we must specify "elm-webpack-loader" rather than just "elm-webpack" as Evan and Richard had in their example.
  </figcaption>
  </figure>
</div>

### Step 3 - Install Elm packages
[Install elm](https://guide.elm-lang.org/install.html) if you haven't already, and then run the following two commands:

```
elm-package install elm-lang/core
elm-package install elm-lang/html
```

You will want to add `elm-stuff` to your `.gitignore` at this point.

### Step 4 - Replace React component with Elm
Now we can easily replace the React component in our `app.js` file with Elm:

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2018/app.png" target="_blank"><img alt="app" class=" lazyloaded" src="/assets/images/seanhelvey/2018/app.png">
    </a>
  <figcaption>
    Replace the React component in `app.js` with Elm
  </figcaption>
  </figure>
</div>

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2018/addCard.png" target="_blank"><img alt="addCard" class=" lazyloaded" src="/assets/images/seanhelvey/2018/addCard.png">
    </a>
  <figcaption>
    Our Elm file is hello world for now
  </figcaption>
  </figure>
</div>

We will replace the react view with Elm in [part #2](http://www.seanhelvey.com/elm-in-react-part-2/)
