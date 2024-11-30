---
layout: post
title:  "Understanding 'this' in JavaScript"
date:  2018-12-11
permalink: /:title/
---

Here is a snippet and [link to my favorite example](http://dev.seanhelvey.com/this/this.html) that you can use to understand `this` in JavaScript. Make sure you have the console open and read the logs as you click on the buttons. The code is [here in GitHub](https://github.com/seanhelvey/snippets/tree/master/this) as well.

<div class="sean-blog-image">
  <figure>
    <a href="" target="_blank"><img alt="todo" class=" lazyloaded" src="/assets/images/seanhelvey/2018/thisES56.png">
    </a>
  <figcaption>
    this.age works as expected with an ES6 arrow function
  </figcaption>
  </figure>
</div>

# Why 'this' example?

This example is helpful because it doesn't need to be transpiled. It works with vanilla JS today in current browsers. Most students these days are working in a React codebase where they can magically write a method as an arrow function, but the [class fields proposal](https://github.com/tc39/proposal-class-fields) isn't official yet. Here is [a Stack Overflow answer](https://stackoverflow.com/questions/45785117/arrow-functions-within-classes-are-not-supported-in-chrome-but-work-fine-through#answer-45788648) explaining that with more context.

```
console.log("window", this)

class Person {
    constructor (name, age) {
        this.name = name;
        this.age = age;

        this.makeOlderES5 = function(event) {
            console.log("makeOlderES5")
            console.log("this", this)
            console.log("event.target", event.target)
            this.age++;
            console.log("this.age", this.age)
        }

        this.makeOlderES6 = (event) => {
            console.log("makeOlderES6")
            console.log("this", this)
            console.log("event.target", event.target)
            this.age++;
            console.log("this.age", this.age)
        }
        console.log("person", this)
    }
}

let person = new Person("Jake", 55)

let buttonES5 = document.querySelector(".ES5")
buttonES5.addEventListener("click", person.makeOlderES5);

let buttonES6 = document.querySelector(".ES6")
buttonES6.addEventListener("click", person.makeOlderES6);
```