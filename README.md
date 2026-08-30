# seanhelvey.com

Personal site and blog. Jekyll, hosted on GitHub Pages, custom domain via `CNAME`.

## Local

```
bundle install
bundle exec jekyll serve    # http://localhost:4000
bundle exec jekyll build    # one-shot build into _site/
rm -rf _site                # do this before checking generated pages
```

## Layout

```
_posts/        posts, front matter uses `permalink: /:title/`
_layouts/      default, page, post, topic
_includes/     head (meta, Open Graph), header, footer, structured-data,
               more-writing, newsletter
_data/         featured.yml, the three homepage picks
_plugins/      archive_meta.rb, the only custom Ruby (see Topics)
css/main.scss  entry point, `@use`s the partials in _sass/
_sass/         _variables (Sass vars, no output), _tokens (:root palette),
               _base, _layout, _syntax-highlighting
assets/        images and PDFs
```

`_site/` is generated and gitignored. `sitemap.xml` is generated at build time, so it
is not in the source tree.

## Topics

Each post carries `tags` in its front matter. `jekyll-archives` turns those into one
page per tag at `/topics/<name>/`, and the tag list also renders on the post meta line
and in the "More writing" block at the foot of each post.

```yaml
tags: [Python, JavaScript]
```

That is the whole system. Eleven tags across 57 posts, no plugin, no vocabulary, no
build step. To add a topic, use a new tag name in a post; the page appears on the next
build.

The tags were seeded by a one-off script that scored every post body against a keyword
vocabulary, so the 13-year archive got labelled without hand-tagging 57 files. That
scoring code has been deleted: it was ~150 lines of custom Ruby plus a lock file and a
CI check, all to avoid typing one line per post. Deriving was the right way to
*migrate* and the wrong way to *maintain*.

A tag holding only one post is skipped in the "More writing" block, since a link
promising more that leads back to the page you just read is worse than no link.
`Career` is currently in that state.

### Tag pages are noindex on purpose

`_plugins/archive_meta.rb` marks every tag page `noindex, follow` and keeps it out of
the sitemap. It is the only custom Ruby in the repo, and it exists because
`jekyll-archives` offers no way to set front matter on the pages it generates and
`defaults` in `_config.yml` cannot reach them, since they have no file on disk.

The two flags must move together. A noindexed URL left in a sitemap is reported by
Search Console as an error rather than quietly ignored, so setting one without the
other is worse than doing neither. That is why they are set in one place.

`follow` is deliberate: crawlers still walk these pages, so the tag hub keeps
distributing internal links to the posts even though the hub itself will not rank.
The trade is that tag pages cannot earn organic traffic. For a 57-post site they were
never going to. Delete two lines in that plugin to reverse it.

## Related posts

There are none, deliberately. Two versions were built and both were removed:

1. **Shared topics.** Recommendation quality became a hostage to the taxonomy: the RAG
   post got exactly one neighbour because only two posts carried the AI tag.
2. **TF-IDF cosine similarity.** Better across most of the archive, and genuinely good
   on the money and meditation posts, but it put *Mouse Trap* (2013) under the newest
   technical writing. That was not a bug. With 309 characters of prose in that post and
   no other modern technical writing to match, old JavaScript posts really are its
   nearest neighbours.

The fix was to stop making claims about which specific posts are similar. A Python post
linking to "Python" is always right and needs no tuning.

## Homepage

The three featured posts are listed in `_data/featured.yml`. Change a `url` there and
rebuild; nothing else reads the file and no post carries `featured` front matter.
`blurb` is optional and falls back to the post's `subtitle`.

## Continuous integration and deploy

`.github/workflows/ci.yml` builds the site, runs `html-proofer` over `_site`, and on a
push to `main` deploys the built artifact through `actions/deploy-pages`. Pull requests
get the build and the checks and stop there. External links are not checked on purpose;
a 13-year archive points at plenty of sites that have since moved.

**This workflow only becomes the live deploy path once the repository's Pages source is
switched over.** Settings, Pages, Build and deployment, Source: change "Deploy from a
branch" to "GitHub Actions". Until that is done the site is still published by the
legacy branch build, which ignores `_plugins/` and would serve 57 posts with broken
topic links.

The site runs Jekyll 4 directly rather than the `github-pages` gem, which is what makes
`_plugins/` possible. `Gemfile.lock` is committed so CI and local builds resolve the
same gems.

A local `jekyll build` writes `localhost:4000` into canonical and Open Graph URLs.
That is Jekyll 4 behaviour outside `JEKYLL_ENV=production`, which CI sets.

## Styling

Colours are CSS custom properties on `:root` in `css/main.scss`, with a dark set under
`prefers-color-scheme: dark`. There is no toggle; the site follows the reader's system
setting. Add new colours as tokens rather than literals so the dark palette can
override them.

Type and spacing are a scale, not per-rule values:

| | |
|---|---|
| font | `system-ui` stack, resolving to SF / Segoe / Roboto per platform. No webfont request. |
| body | 17px / 1.65 |
| headings | `h1` 2.125rem down to `h4` 1.0625rem, weight 650, set once in `_sass/_base.scss` |
| spacing | `$space-1` through `$space-6`, 0.25rem to 4rem |
| measure | 38em on prose blocks |

Set sizes from the scale rather than adding px values to individual components. The
site previously had no heading scale at all, so every heading rendered at the browser
default at weight 400, and `.post-content h2` was separately set to 32px, which left an
in-post heading nearly the size of the page title.

The masthead is flexbox. It used floats and a 5px slab border, both minima defaults,
which is most of what made the site read as an unmodified Jekyll theme.

Sass uses the module system. `_variables.scss` emits no CSS and every partial `@use`s
it directly, since `@use` does not share variables the way `@import` did. `@extend`
does not cross module boundaries, so use a declaration or a mixin instead.

## Verifying a style change

Styling is CSS-only by convention, which makes regressions cheap to rule out:

```
JEKYLL_ENV=production bundle exec jekyll build
diff -rq <saved _site> _site        # only css/main.css should differ
```

If a stylesheet edit changes any `.html` file, something touched markup and the diff
will say so. The Jekyll 4 restyle was verified this way: 73 files, zero HTML changes.

See `CLAUDE.md` for the writing voice and for the decisions behind these choices.
