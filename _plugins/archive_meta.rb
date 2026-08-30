# Marks jekyll-archives tag pages as noindex and keeps them out of the sitemap.
#
# Why a plugin at all, when everything else here is stock: jekyll-archives builds
# its pages in a generator and offers no way to set front matter on them, and
# `defaults` in _config.yml cannot reach them because they have no source path on
# disk. This is the only seam where the two plugins can be told about each other.
#
# Why exclude them: the tag pages exist for a reader browsing by subject. They
# are thin (one to twelve links) and restate what /blog.html already lists, so
# Google would file most of them under "Crawled - currently not indexed" on its
# own. Saying so deliberately keeps Search Console quiet.
#
# noindex WITHOUT the sitemap exclusion would be worse than doing nothing: a
# noindexed URL submitted in a sitemap is reported as an error, not ignored. The
# two have to move together, which is why they are set in one place.
#
# `follow` is deliberate. Crawlers still walk these pages, so the tag hub keeps
# doing its internal-linking job for the posts themselves.
module ArchiveMeta
  class Generator < Jekyll::Generator
    # jekyll-archives runs at the default priority and jekyll-sitemap at
    # :lowest, so :low lands between them.
    priority :low

    def generate(site)
      # `type` is a method on Jekyll::Archives::Archive, not a key in `data`,
      # which only carries "layout". Checking data["type"] silently matches
      # nothing and the build still goes green, so select on the method.
      tagged = site.pages.select { |page| page.respond_to?(:type) && page.type == "tag" }
      tagged.each do |page|
        page.data["sitemap"] = false
        page.data["noindex"] = true
      end
      Jekyll.logger.info "Archives:", "#{tagged.size} tag pages set noindex, follow and excluded from the sitemap"
    end
  end
end
