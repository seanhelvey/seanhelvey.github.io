# seanhelvey.com

Jekyll site on GitHub Pages, custom domain via `CNAME`. Personal site and blog for Sean Helvey.

## Writing voice

Site copy should sound like a person, not a model.

- No em dashes or en dashes. Ordinary hyphens in compound words are fine and wanted.
- Avoid AI-tell phrasing: overpolished tricolons, "the next chapter involves", and similar.
- Do not repeat a distinctive word twice in close proximity on the same page.

## Content that is intentional, do not "fix"

- **The prose on `index.html` and `about.html` is deliberate.** It is written to read honest and organic, not optimized for recruiters. Do not add metrics, tighten it into resume bullets, or otherwise make it read like a candidate profile.
- **AppFolio (2019-2020) is omitted from the site on purpose.** It stays on the resume PDF only. Not a gap, do not flag it.
- **`resume.html` is deliberately `noindex, nofollow`** with `sitemap: false`, and redirects to `assets/HelveyResume2026.pdf`. The resume is not meant to be indexed. `robots.txt` disallows both paths to match.

## LLM and search visibility

Set up in August 2026, based on Evil Martians' measured LLM traffic study
(<https://evilmartians.com/chronicles/which-ai-actually-reads-your-site-two-months-of-llm-traffic-measured>),
not on their `llms-visibility` skill, which is partly stale relative to their own data.

What is in place:

- `robots.txt` with `Content-Signal: search=yes, ai-input=yes, ai-train=yes`, AI crawlers named explicitly, resume paths disallowed, sitemap declared.
- `jekyll-sitemap` plugin. Both PDFs excluded via `defaults` in `_config.yml`.
- Per-page `<title>` and `<meta name="description">` in `_includes/head.html`, plus Open Graph and Twitter cards. Pages may set `description` and `seo_title` in front matter; posts fall back to `subtitle` then `excerpt`.
- `_includes/structured-data.html`: JSON-LD `Person` on every page, `BlogPosting` on posts linked to the same `@id`.

### Deliberately not done, these are decisions and not oversights

- **`Accept: text/markdown` content negotiation.** The single most effective technique in the study, and impossible on GitHub Pages, which gives no control over response headers. Would require putting Cloudflare in front of the site. Judged not worth the infrastructure.
- **`llms.txt` and `llms-full.txt`.** The study found only ~37 of 660 fetches came from named AI assistants, the rest generic bots.
- **`.md` route mirrors and `Link rel="alternate"` hints.** Not independently valuable per the study, and the discovery hints got zero attributable fetches over two months.
- **Hidden pointer text for LLMs.** Recommended by the skill, contradicted by the same company's later data.

### JSON-LD, a known disagreement

The `llms-visibility` skill lists JSON-LD as an anti-pattern, on the grounds that no LLM tool parses it. It is kept here anyway, for a different purpose: Google and Bing entity resolution, and the `sameAs` links tying this domain to the GitHub, LinkedIn, Bluesky, Mastodon, and Goodreads accounts as one person. That serves the recruiter-searches-your-name path, which matters more here than direct agent fetching. Remove it only on purpose, not because a skill flags it.

## Topics

Front-matter `tags` plus `jekyll-archives`. No custom code.

- **The tags were derived once, as a migration.** A scoring plugin labelled the 13-year archive so it did not need hand-tagging, then it was deleted. If a label is wrong, fix that post's `tags` line. Do not rebuild the derivation; it was ~150 lines of Ruby, a lock file and a CI check to save typing one line per post.
- **`jekyll-archives` reads `tags` only.** That is why it did not fit while topics were derived, and why it fits now.
- **WordPress-era `tags` were replaced.** They had inconsistent casing and long-tail terms like `ipdb` and `GPU`, which would each have become an archive page. They remain in git history. `categories:` is untouched and inert, archives is configured for tags only.
- **Eleven tags is the point.** Resist adding narrow ones; a tag holding one post is a page a reader has no reason to visit. `Career` is currently at one.

## No related posts

Two versions were built and both removed: shared-topic overlap, then TF-IDF cosine similarity. The second was decent on most of the archive but put 2013 filler under the newest technical posts, correctly, because the two microposts carry ~300 and ~480 characters of prose and the archive has no other modern technical writing. A recency prior was also tried and reverted; it broke the best match on the site and fixed neither post it targeted.

The footer links to tag pages instead. It cannot be wrong the way a recommendation can. If you are tempted to add recommendations back, the constraint is the corpus, not the algorithm.

## Homepage

The three posts on the homepage are curated in `_data/featured.yml`, not taken from the top of the archive, so what a first-time reader lands on is a decision rather than a function of the publishing schedule. Swapping one is a one-line edit; no post carries `featured` front matter.

`blurb` in that file is optional and falls back to the post's `subtitle`. A post with neither shows title and date only.

The hero link points at `about.html`. It used to point at The Next Step, which went stale as that post aged; the post is still reachable, because the Climatebase one links to it and sits first in `featured.yml`. The link text deliberately avoids "here" and "more", which the "Start here" heading and the hero sentence already use, and avoids plain "About", which the nav uses.

The hero copy is short on purpose. Longer versions were tried and each one either read as a written-out bio or leaned on the foster care work in a way that made it a credential. The concrete material lives on `about.html` and in the posts, where there is room for it.

## Deploy

`.github/workflows/ci.yml` builds, runs `html-proofer`, and deploys from `main` via `actions/deploy-pages`. Pull requests build and check only.

**Prerequisite that is not in the repo:** the Pages source must be set to "GitHub Actions" in repository settings. As of this writing the API still reports `build_type: legacy`, meaning the branch builder is live and the workflow publishes nothing.

That setting is now load-bearing, not just tidiness. The legacy builder ignores `_plugins/` entirely, so pushing before flipping it produces a green build with no topic pages and 57 posts whose topic links all 404.

External link checking is off in `html-proofer` on purpose. A red build caused by someone else's outage teaches you to ignore the build.

### Off the github-pages gem

The site runs Jekyll 4 directly, not the `github-pages` gem, because deploying from Actions lifts the plugin whitelist and the Jekyll 3.10 pin. What that move involved, for reference if anything looks off:

- Sass switched from libsass to dart-sass. Eleven `$spacing-unit / 2` divisions became `* 0.5`, which is valid under both engines. CSS output was byte-identical.
- Seven Sass colour variables were dead, orphaned when the palette moved to custom properties. Removing them cleared every `lighten()` and `darken()` deprecation.
- `sass: style: compressed` and `sourcemap: never` in `_config.yml`, since dart-sass expands output and writes a map by default. 17.5KB to 14.5KB.
- `_site/assets/css/style.css`, a 136KB minima leftover that nothing linked to, stopped being generated.
- Jekyll 4 rewrites `site.url` to `localhost:4000` unless `JEKYLL_ENV=production`. CI sets it. A local build will show localhost canonicals, which is correct and not a bug.

Sass uses the module system, not `@import`, which is deprecated and goes away in Dart Sass 3.0. `_sass/_variables.scss` holds the variables and the `media-query` mixin and emits no CSS; `_sass/_tokens.scss` holds the `:root` palette. Every partial `@use "variables" as *` for itself, because `@use` does not share variables the way `@import` did.

One casualty worth knowing: `@extend %vertical-rhythm` in `_syntax-highlighting.scss` had to become a plain `margin-bottom`. Placeholders defined in another module are not reachable across a `@use` boundary. If you reach for `@extend` across partials, it will not work; use a mixin or a declaration.

## Styling

The README documents the type and spacing scale. The decisions behind it:

- **The brief was never dark mode.** It was to stop looking like an unmodified Jekyll theme. Dark mode repainted a 2014 layout. What actually dated the site was minima's leftovers: the `"Helvetica Neue", Helvetica, Arial` stack, a float-based masthead with a 5px slab border, no type scale at all, and `.page-heading` at 20px weight 400. Those are fixed. Reach for structure and type before colour.
- **`system-ui`, not a webfont.** Current on every platform with no render-blocking request. Revisit only if there is a reason a webfont earns its cost.
- **Sizes come from the scale in `_sass/_base.scss`.** Do not add px font sizes to individual components; that is how an in-post `h2` ended up nearly the size of the page title.
- **Style changes are CSS-only.** Verified by diffing `_site`: if any `.html` differs, markup moved and it is no longer a safe style change. This is the regression guarantee, use it.

Two deliberate exceptions in dark mode:

- **Code blocks keep a light surface.** The Rouge token colours are tuned dark-on-light and most would need remapping to survive an inversion, which lands on neon. The surface is softened off white instead.
- **Photographs get `brightness(0.92)`.** They are lit for a white page and glare on a dark one.

The EmailOctopus signup embed is themed by redefining the custom properties it exposes, on the elements it sets them on. Do not box it in a card instead.

## Local development

```
bundle exec jekyll build     # or: bundle exec jekyll serve
bundle exec htmlproofer ./_site --disable-external --allow-hash-href --no-enforce-https
```

Delete `_site/` before checking generated pages. A stale directory can leave plugin output looking absent when it is not.

`_site/` is generated and gitignored. `sitemap.xml` and `robots.txt` will not appear in the repo source; the sitemap is generated at build time.

## Conventions

- Sean handles his own commits and pushes. Make edits and stop.
- Posts live in `_posts/`, front matter uses `permalink: /:title/`.
