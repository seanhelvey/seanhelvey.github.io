---
layout: post
title:  "Go is Not Python"
date:   2017-06-18-go-is-not-python.md
permalink: /:title/
---

You know Python fairly well, but your manger wants to start using Go "because it is faster". Being the overacheiver that you are, you sacrifice time from your precious weekend to figure out the basics. Take a trivial Python program like this for instance:

```
def main():

  students = [
    {
      "name": "fred"
    },
    {
      "name": "karen"
    }
  ]

  for student in students:
    if student['name'] == "fred":
      fred = student

  print fred['name']

if __name__=='__main__':
  main()
```

What is the output of that program? 

```
>> python for_loop.py
>> fred
```

Fred! Of course. An if statement, a for loop. Let's port it to go:

```
package main

import "fmt"

type Student struct {
    name string
}

func main() {
    var students [2]Student
    students[0].name = "fred"
    students[1].name = "karen"

    var fredPtr *Student
    fredPtr = nil

    for _, student := range students {
        if student.name == "fred" {
          fredPtr = &student
        }
    }

    fmt.Println(fredPtr.name)
}
```

What is the output of that program?

```
>> go run for-loop.go 
>> karen
```

<div style="width: 410px" class="wp-caption alignnone">
  <a href="https://media1.giphy.com/media/ma7VlDSlty3EA/giphy.gif"><img alt="Confused" src="https://media1.giphy.com/media/ma7VlDSlty3EA/giphy.gif" height="224" /></a>
  
  <p class="wp-caption-text">
    Huh?
  </p>
</div>

I've used a funny gif here to get my point across, but the impact of this misunderstanding can be severe. The value property of range (stored here as student) is a copy of the value from students, not a pointer to the value in students. See [golang Range Gotchas on GitHub](https://github.com/golang/go/wiki/Range#gotchas) and [A Tour of Go - Range](https://tour.golang.org/moretypes/16) for more info.

<div style="width: 800px" class="wp-caption alignnone">
  <a href="/assets/images/seanhelvey/2017/GolangRange1.png"><img alt="Confused" src="/assets/images/seanhelvey/2017/GolangRange1.png"/></a>
</div>

<div style="width: 800px" class="wp-caption alignnone">
  <a href="/assets/images/seanhelvey/2017/GolangRange2.png"><img alt="Confused" src="/assets/images/seanhelvey/2017/GolangRange2.png"/></a>
</div>

The solution: we have to store a pointer to the value in students, rather than a pointer to the copy of the value from students.

```
package main

import "fmt"

type Student struct {
    name string
}

func main() {
    var students [2]Student
    students[0].name = "fred"
    students[1].name = "karen"

    var fredPtr *Student
    fredPtr = nil

    for idx, student := range students {
        if student.name == "fred" {
          fredPtr = &students[idx]
        }
    }

    fmt.Println(fredPtr.name)
}
```
I've seen serious bugs in production written by bright Python developers because of this misunderstanding. Go is not Python!