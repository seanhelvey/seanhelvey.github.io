---
layout: post
title:  "Syncing Types Between FastAPI/Pydantic and TypeScript"
subtitle: "The Mullet Stack: JavaScript in the front, Python in the back"
seo_title: "Syncing Types Between FastAPI/Pydantic and TypeScript"
description: "A field guide to wiring modern Python and JavaScript together, built around one small feature shipped across a real FastAPI backend and a real React frontend. The frontend's types are generated from the backend's schema, so the two ends cannot drift."
date:   2026-08-25
permalink: /:title/
micropost: true
published: true
---

I wanted a <a href="https://seanhelvey.com/mullet-stack/guide/">field guide</a> to stay current on modern full-stack web development with JavaScript and Python. Hence the mullet: JavaScript in the front, Python in the back.

<div class="sean-blog-gallery sean-blog-gallery-stack">
  <figure>
    <a href="https://seanhelvey.com/mullet-stack/guide/">
      <img alt="A timeline showing TypeScript checking types at build time and then erasing them, Pydantic checking every response on the server, and nothing left to check once the browser receives the JSON" src="/assets/images/seanhelvey/2026/mullet-type-erasure.png">
    </a>
    <figcaption>Each side checks its own types, and nothing is watching where they meet</figcaption>
  </figure>
</div>

<p class="micropost-links">
  <a class="go" href="https://seanhelvey.com/mullet-stack/guide/">Read the guide &#8594;</a>
  <span class="aside">One page, no clone required. <a href="https://github.com/seanhelvey/mullet-stack" target="_blank">Source on GitHub</a>.</span>
</p>
