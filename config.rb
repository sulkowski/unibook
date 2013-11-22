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

helpers do
  def student_section?
    current_page.path.start_with?('student')
  end

  def teacher_section?
    current_page.path.start_with?('teacher')
  end

  def current_section
    if student_section?
      'student'
    elsif teacher_section?
      'teacher'
    else
      ''
    end
  end

  def active?(*names)
    if current_page.path.start_with?(*names)
      'active'
    else
      ''
    end
  end

  def icon(name)
    "<span class=\"icon glyphicon glyphicon-#{name}\"></span>"
  end

  def breadcrumbs
    # rozpierdol.rb
    breadcrumbs = current_page.data.breadcrumbs || [current_page.data.title || 'No name']
    html = "<ol class=\"breadcrumb\"><li><a href=\"/#{current_section}/\">Home</a></li>"
    if breadcrumbs.length > 1
      path = current_page.path.split('/')[1] || '#'
      html += "<li><a href=\"/#{current_section}/#{path}/\">#{breadcrumbs.first}</a></li>"
    end
    "#{html}<li class=\"active\">#{breadcrumbs.last}</li></ol>"
  end
end
