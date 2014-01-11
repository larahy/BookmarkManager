require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmarks_#{env}")

require './lib/link'

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do 
  erb :index
end