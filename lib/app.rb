require 'sinatra/base'
require 'haml'

require File.expand_path('common', File.dirname(__FILE__))
require File.expand_path('models', File.dirname(__FILE__))

class ShowCase < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/admin/' do
    haml :'/admin/index'
  end

  get '/admin/products/' do
    @products = Product.all
    haml :'/admin/products'
  end

  get '/admin/products/new/' do
    @products = Product.all
    haml :'/admin/products/new'
  end

  post '/admin/products/new/' do
    if Product.create_or_update(params)
    else
    end
    redirect to '/admin/products/'
  end

  before '/admin/*' do
    User.authenticate!
  end

end
