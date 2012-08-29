###
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
with_layout :navigator do
  page ""
  page '/helloworld/index.html'
  page '/eames/index.html'
  page '/paradise_pickles/index.html'
  page '/homework_class_1/index.html'
end

# Proxy (fake) files
data.helloworld.exercises.each do |e|
  page "/helloworld/#{e}/index.html", :proxy => "/helloworld/helloworld.html", :ignore => true do
    @title = e.titlecase
  end
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
  def title
    data.titles[id] || id.titlecase || nil
  end

  def breadcrumbs
    return [] unless request && request.path

    parts = request.path.split('/')
    crumbs = parts[1,parts.length-3] || []

    crumbs.map do |c|
      title = data.titles[c] || c.titlecase
      {title: title, url: "/#{c}/"}
    end
  end

  def id
    return [] unless request && request.path
    parts = request.path.split('/')
    return parts[-2]
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end