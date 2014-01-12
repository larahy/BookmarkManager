require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require './lib/link'
require './lib/tag'
require './lib/user'
require_relative 'helpers/application'
require_relative 'datamapper_setup'
require_relative 'controllers/users'
require_relative 'controllers/session'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/application'


enable :sessions
set :session_secret, 'unique'
use Rack::Flash 
set :partial_template_engine, :erb










