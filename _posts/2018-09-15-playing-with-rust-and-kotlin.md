---
layout: post
title:  "Playing with Rust and Kotlin"
date:  2018-09-15
permalink: /:title/
---

While it is clear that I enjoy using Elm for front-end web development, I've been trying to find the best tool for simple back-end web applications for several years now. I want to share two toy projects I recently started working on in case it is helpful for anyone out there. Both have been deployed to Heroku.

# Language Features

Each of these languages has the features that I'm looking for:
- Static typing
- Immutability
- Sum types
- Safety

# Kotlin & Ktor

[Kotlin Playground](https://github.com/seanhelvey/kotlinplayground)  
A Kotlin toy back-end. Initially written with Spark before being ported to Ktor.

While Spring may be the obvious choice for Java/Kotlin projects, I tried Spark before settling on Ktor because the framework appears to fully utilize Kotlin's DSL capabilities. Code looks declarative, but the APIs are mostly function calls with lambdas.

# Rust & Rocket

[Rust Playground](https://github.com/seanhelvey/rustplayground)  
A Rust toy back-end using the web framework Rocket.

Short to medium term it seems as if Kotlin is my best bet, due to the language features and its widespread adoption. Longer term as the industry (hopefully) moves away from dependency on the JVM, Rust seems very well positioned to gain market share.

# Conclusion

Please feel free to follow along as I tinker with these projects! Huge thanks to [Brent Gardner](https://github.com/bgard6977?tab=followers) for pairing with me on this and [Damien LeBerrigaud](https://github.com/dam5s) for all of the inspiration.
