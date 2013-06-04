require 'yaml'


activate :sync do |sync|
  secret = YAML.load_file(File.dirname(__FILE__)+'/.secrets.yml')

  sync.fog_provider = secret['fog_provider']
  sync.fog_directory = secret['fog_directory']
  sync.fog_region = secret['fog_region']
  sync.aws_access_key_id = secret['aws_access_key_id']
  sync.aws_secret_access_key = secret['aws_secret_access_key']

  sync.existing_remote_files = 'keep' # What to do with your existing remote files? ( keep or delete )
  sync.gzip_compression = true # Automatically replace files with their equivalent gzip compressed version
  sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
end

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