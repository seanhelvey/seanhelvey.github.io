source 'https://rubygems.org'

# Jekyll direct, not the github-pages gem. The site deploys from a GitHub Actions
# workflow, so the Pages plugin whitelist and its Jekyll 3.10 pin no longer apply,
# and _plugins/ runs.
gem "jekyll", "~> 4.3"

group :jekyll_plugins do
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-archives", "~> 2.3"
end

group :test do
  gem "html-proofer", "~> 5.0"
end
