require 'sinatra'
require 'sinatra/cache'
require 'sinatra/static_assets'
require 'haml'
require 'builder'

set :run, true
set :cache_enabled, true
set :haml, :escape_html => true

Sinatra::Base.register Sinatra::StaticAssets
Sinatra::Base.register Sinatra::Cache

before do
  content_type 'text/html', :charset => 'utf-8'
end

configure do
  %w(lib config models).each do |lib|
    Dir.glob("#{lib}/**/*.rb").sort.each {|f| load f}
  end
end

helpers do
  include Rack::Utils
  alias h escape_html
end

get '/' do
  'hello'
end

get '/rss.xml' do
  @albums = Album.active.limit(20).order_by(:created_at.desc)
  content_type 'text/xml'
  builder :feed
end
