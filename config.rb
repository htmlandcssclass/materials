activate :deploy do |deploy|
  deploy.method = :ftp
  deploy.host = IO.read(File.dirname(__FILE__)+'/.secrets/host.txt')
  deploy.user = IO.read(File.dirname(__FILE__)+'/.secrets/user.txt')
  deploy.password = IO.read(File.dirname(__FILE__)+'/.secrets/password.txt')
  deploy.path = ""
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