require 'sinatra'
require 'sinatra/cache'
require 'sinatra/static_assets'
require 'haml'

before do
  content_type 'text/html', :charset => 'utf-8'
end

configure do
  %w(lib config models).each do |lib|
    Dir.glob("#{lib}/**/*.rb").sort.each {|f| load f}
  end
end

get '/' do
  'hello'
end
