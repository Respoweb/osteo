activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :gzip
  activate :minify_html
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :directory_indexes
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end


set :url_root, 'http://example.com'
activate :search_engine_sitemap

activate :s3_sync do |s3_sync|

end

caching_policy 'text/html', cache_control: {max_age: 7200, must_revalidate: true}, content_encoding: 'gzip'
caching_policy 'image/png', cache_control: {max_age: 31536000, public: true}, content_encoding: 'gzip'
caching_policy 'image/jpeg', cache_control: {max_age: 31536000, public: true}, content_encoding: 'gzip'
caching_policy 'text/css', cache_control: {max_age: 31536000, public: true}, content_encoding: 'gzip'
caching_policy 'application/javascript', cache_control: {max_age: 31536000, public: true}, content_encoding: 'gzip'
