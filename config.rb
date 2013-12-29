###
# Compass
###

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
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# use the imageoptim middleman plugin to optimize all images
# see: https://github.com/plasticine/middleman-imageoptim
activate :imageoptim

# Methods defined in the helpers block are available in templates
helpers do
  # Helper method for displaying active navbar llinks
  #
  # == Parameters:
  # active:: The name of the current navbar element
  # arg:: The name of the current page, defaults to `currnet_page.data.pageId`
  # cssclass:: The class to append, defaults to `"active"`
  #
  # == Returns:
  # A string such as class="active" if active==arg
  #
  def is_active(active, arg=current_page.data.pageId, cssclass="active")
    if arg == active
        " class=\"" + cssclass + "\""
    end
  end
  
  SQUARE_HEIGHT = 170

  def affiliation_square(img, url=nil)
    if !img.has_key?(:width) && !img.has_key?(:height) && !img[:url].include?("://")
        real_path = img[:url]
        real_path = File.join(images_dir, real_path) unless real_path.start_with?('/')
        full_path = File.join(source_dir, real_path)

      if File.exists?(full_path)
        begin
          width, height = ::FastImage.size(full_path, :raise_on_failure => true)
          img[:width]  = width
          img[:height] = height
        rescue FastImage::UnknownImageType
          warn("Image not supported")
          # No message, it's just not supported
        rescue
          warn "Couldn't determine dimensions for image #{path}: #{$!.message}"
        end
      end
    end

    margin_top = ((SQUARE_HEIGHT - img[:height])/2).to_i
    margin_bottom = (SQUARE_HEIGHT - margin_top - img[:height])

    img_style = "margin-top: #{margin_top}px; margin-bottom: #{margin_bottom}px;"

    img_tag = image_tag(
                        img[:url], 
                        :itemprop => "image", 
                        :alt => img[:alt], 
                        :title => img[:title],
                        :width => img[:width],
                        :height => img[:height],
                        :style => img_style
    )
  
    warn("Image: #{img}")
    # if we have a URL then link the image with link_to
    unless url.nil?
      img_tag = link_to img_tag, url
    end
    '<li class="previous-affiliation"><div class="affiliation-square">' + img_tag + '</div></li>'
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :relbase, ''

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
