require 'sinatra/base'
require 'erb'

require File.expand_path('models', File.dirname(__FILE__))

class ShowCase < Sinatra::Base
  get '/' do
    erb :index
  end
end
