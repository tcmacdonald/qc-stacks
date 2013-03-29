###---------------------------------------------------- Gem Requirements Settings

require 'compass'
require 'susy'


###---------------------------------------------------- Blog Settings

activate :blog do |blog|
  # blog.prefix = "blog"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year/:month/:day/:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "article"
  blog.summary_separator = /(READMORE)/
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  blog.default_extension = ".erb"
  blog.paginate = false
  blog.calendar_template = "calendar.html"
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end


###---------------------------------------------------- Layout Settings

page "/", layout: "public"
page "/about", layout: "public"
page "/email/*", layout: false
page "/feed.xml", layout: false


###---------------------------------------------------- Helper Methods

helpers do
  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end
end


###---------------------------------------------------- Build Settings

configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

###---------------------------------------------------- Deploy Settings

activate :deploy do |deploy|
  deploy.method = :git
  deploy.user = "procload"
end
