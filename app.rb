require 'sinatra'
require 'sinatra/reloader'

get '/' do
  puts "Root path accessed"
  erb :index
end