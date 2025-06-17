require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

# データベース設定
set :database_file, 'config/database.yml'

get '/' do
  puts "Root path accessed"
  erb :index
end
