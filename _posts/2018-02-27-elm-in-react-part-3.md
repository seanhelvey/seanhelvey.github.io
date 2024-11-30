---
layout: post
title:  "Elm in React Part #3"
date:  2018-02-27-elm-in-react-part-3.md
permalink: /:title/
---

This is a follow-up to [Elm in React Part #2](http://www.seanhelvey.com/elm-in-react-part-2/). We have replaced the "add todo" form view of a React todo list app with Elm, but we still need model and update functions as part of The Elm Architecture. We also need ports to communicate with JavaScript or React in this case. Checkout the Elm branch of [this todo list repo](https://github.com/seanhelvey/react-intro-exercise) if you want to follow along. Here are the remaining steps:

1. Create a Html.program following the [react-elm-components](https://github.com/evancz/react-elm-components/blob/master/example/Chat.elm) example
2. Wire-up view to produce a message and display the updated model
3. Use ports to send messages to JavaScript / React
4. Subscribe to the port in your JavaScript / React

> "When the user clicks on a button, it produces a message. That message is piped into the update function, producing a new model. We use the view function to show the new model on screen. And then we just repeat this forever!" - Evan Czaplicki

### Step 1 -  Create a Html.program
Take a good look at the [react-elm-components](https://github.com/evancz/react-elm-components/blob/master/example/Chat.elm) example and think about how you can solve this problem using The Elm Architecture. I decided that our model could simply be the `Input String` portion of the model used in the example.

#### Model
```
type alias Model =
    { input : String }
```

The Msg and update function could be very similar too. We can still have an `Input` case for user input, and we can use the Msg `Submit` instead of send.

#### Msg
```
type Msg
    = Submit
    | Input String
```

#### Update
```
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Submit ->
            let
                oldInput =
                    model.input
            in
                ( { model | input = "" }
                , submit oldInput
                )

        Input newInput ->
            ( { model | input = newInput }
            , Cmd.none
            )
```

What is lowercase "submit" where it says `submit oldInput` in the snippet above? That is our port, which we will discuss next. Feel free to replace it with `Cmd.none` temporarily and allow the compiler to guide you the rest of the way.

There is a certain amount of pain and pleasure that we experience using a compiled language. It takes patience and practice in order to become comfortable with the process. Try to have some fun exploring this! Don't forget that [this todo list repo](https://github.com/seanhelvey/react-intro-exercise) has my solution in the Elm branch.

### Step 2 - Wire-up view
We will now wire-up the view to produce a message and display the updated model. Remember our stub view from [Elm in React Part #2](http://www.seanhelvey.com/elm-in-react-part-2/)?

#### Our stub view function
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

Let's make it so that when a user clicks on a button, it produces a message. Once that message has been piped into the update function, we will use the view function to show the new model on screen.

#### The completed view function
```
view : Model -> Html Msg
view model =
    let
        options =
            { stopPropagation = False, preventDefault = True }
    in
        form [ class "well", onWithOptions "submit" options (Json.succeed Submit) ]
            [ fieldset [ class "form-group" ]
                [ label [ attribute "htmlFor" "title" ]
                    [ text "Title" ]
                , input [ class "form-control", value model.input, id "title", onInput Input ] []
                ]
            ]

```

### Step 3 - Use ports to communicate with JavaScript / React
To use Elm ports, we need the keyword "port" in front of our module declaration at the top of the file.

```
port module AddCardForm exposing (main)
```

Now we add a port for sending Strings out to JavaScript or React.

```
port submit : String -> Cmd msg
```

It could be a different type such as `List Float`. [Here is an example](https://github.com/seanhelvey/valunicorn/blob/master/src/Calculator.elm) of a port sending a `List Float` to JavaScript.

### Step 4 - Subscribe to the port from JavaScript / React
The [react-elm-components](https://github.com/evancz/react-elm-components/blob/master/example/Chat.elm) library allows us to very simply wire up ports with our React component in the following way:

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2018/addPortsReact.png" target="_blank"><img alt="addPortsReact" class=" lazyloaded" src="/assets/images/seanhelvey/2018/addPortsReact.png">
    </a>
  <figcaption>
    We are done!
  </figcaption>
  </figure>
</div>

So this is the end of our three part series of blog posts on "Elm in React". I learned a ton going through this and would appreciate any feedback you have. Hopefully it helps someone gradually incorporate Elm into an existing JavaScript or React application. Thanks for tuning in!
