---
layout: post
title:  "Elm in React Part #2"
date:  2018-02-27-elm-in-react-part-2.md
permalink: /:title/
---

This is a follow-up to [Elm in React Part #1](http://www.seanhelvey.com/elm-in-react-part-1/). In the first post we replaced the "add todo" form portion of a React todo list app with "hello world" written in Elm. Now we will replace the Elm "hello world" stub with an Elm view. Checkout the Elm branch of [this todo list repo](https://github.com/seanhelvey/react-intro-exercise) if you want to follow along. In plain English these are the steps I took:

1. Surrender to the Elm Architecture
2. Try to translate the view from JSX to Elm
3. Follow the friendly compiler error messages

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2018/todo.png" target="_blank"><img alt="todo" class=" lazyloaded" src="/assets/images/seanhelvey/2018/todo.png">
    </a>
  <figcaption>
    A simple todo list
  </figcaption>
  </figure>
</div>

### Step 1 -  Surrender to the Elm Architecture
Don't fight or resist it! If you really are porting a React app, you are probably stuck thinking about props, state, and event handlers. In some ways writing an Elm application from scratch is easier than translating existing JavaScript or React. For me, the mental shift back to Elm from React was tough, but it was an amazing learning experience.

One trick I've learned trying to teach Elm over the last couple of months is that you can start with a simple view before diving into model and update. I know this might go against other conventional Elm wisdom and I am open to feedback, but something like this here below can be a nice small step toward Elmy goodness IMHO.

```
port module AddCardForm exposing (main)

import Html exposing (text, form, input, label, fieldset)
import Html.Attributes exposing (attribute, id, class)


main =
    form [ class "well" ]
        [ fieldset [ class "form-group" ]
            [ label [ attribute "htmlFor" "title" ]
                [ text "Title" ]
            , input [ class "form-control", id "title" ] []
            ]
        ]

```

It compiles and looks exactly like it did in the React / JSX version! Now we can add functionality to this view, which will require that we finish building out a model and update function.

### Step 2 - Try to translate the view from JSX to Elm
You can see the finished Elm view and the React / JSX code we replaced in this diff below. The thing is that the awesome Elm compiler will ensure that you have a model and update function before you are really able to "finish" this part of the Elm application. We will cover that next in Part #3. So while you may glance at the diff here below, know that you need to flush out the rest of the Elm Architecture before "wiring up" the view. If these diffs or snippets become confusing, please take a look at the finished Elm branch of this repo [here](https://github.com/seanhelvey/react-intro-exercise/).

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2018/viewDiff.png" target="_blank"><img alt="viewDiff" class=" lazyloaded" src="/assets/images/seanhelvey/2018/viewDiff.png">
    </a>
  <figcaption>
    A google search will lead you to many tools which can help you easily translate HTML or JSX to Elm. You can start there, and then make little tweaks as you see fit. If you have any trouble with elm-format, take a look at this <a href="https://github.com/avh4/elm-format/issues/408" target="_blank">GitHub Issue</a> for guidance.
  </figcaption>
  </figure>
</div>

### Step 3 - Follow the friendly compiler error messages
If you have surrendered to The Elm Architecture (step #1) and tried translating the view from JSX to Elm (step #2) then you should be able to follow the friendly compiler error messages (step #3) as they shepherd you through any confusion from the Elm guide, docs, or other code samples and blog posts you are referring to. In [the next post](http://www.seanhelvey.com/elm-in-react-part-3/) we will illustrate how to do this using the model and update functions along with ports to finish the "add todo" functionality.
