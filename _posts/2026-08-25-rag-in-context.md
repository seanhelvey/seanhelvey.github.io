---
layout: post
title:  "Retrieval-Augmented Generation (RAG) in Context"
seo_title: "Retrieval-Augmented Generation (RAG) in Context"
subtitle: "Searching by meaning and by keyword, why you want both, and 18 labelled questions to check it against"
description: "A notebook refreshing retrieval-augmented generation from the search problem up: embeddings, BM25, rank fusion, a reranker, and a small hand-labelled eval set. Runs on a laptop with no account and no API key."
date:   2026-08-25
permalink: /:title/
micropost: true
published: true
tags: [AI, Python]
---
RAG gets a language model to answer questions from documents it was never trained on, by finding the right passages and pasting them into the prompt. Most of what makes the searching work predates the models, so <a href="https://github.com/seanhelvey/rag-in-context/blob/main/rag.ipynb">this notebook</a> connects it back to ideas that have been around a lot longer.

<div class="sean-blog-gallery sean-blog-gallery-stack">
  <figure>
    <a href="https://github.com/seanhelvey/rag-in-context/blob/main/rag.ipynb">
      <img loading="lazy" decoding="async" alt="Two rows. The top runs once whenever the documents change: corpus, chunk, embed, vectors. The bottom runs for every question: question, keyword plus meaning search, fuse, rerank, prompt, answer" src="/assets/images/seanhelvey/2026/rag-pipeline.png">
    </a>
    <figcaption>The top row runs once whenever the documents change, the bottom row for every question</figcaption>
  </figure>
</div>

<p class="micropost-links">
  <a class="go" href="https://github.com/seanhelvey/rag-in-context/blob/main/rag.ipynb">Read the notebook on GitHub &#8594;</a>
  <span class="aside">About a twenty minute read, no account and no API key. <a href="https://github.com/seanhelvey/rag-in-context" target="_blank">Browse the repo</a>.</span>
</p>
