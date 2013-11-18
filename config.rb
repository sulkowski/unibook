# Add Slim to the available template engines
require 'slim'
set :slim, pretty: true

# Set asset paths
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# Use Autoprefixer for stylesheets
activate :autoprefixer, browsers: 'last 2 versions'

# Build-specific configuration
configure :build do
  # Use relative URLs
  activate :relative_assets
end
