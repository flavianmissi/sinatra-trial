require 'sinatra/base'
require 'rack-flash'
require 'haml'

require File.expand_path('common', File.dirname(__FILE__))
require File.expand_path('models', File.dirname(__FILE__))

class ShowCase < Sinatra::Base
  enable :sessions
  use Rack::Flash
  use Rack::MethodOverride

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
    #if Product.create_or_update(params)
      flash[:notice] = "Product successfully created"
    #else
    #  flash[:warning] = "Error"
    #end
    redirect '/admin/products/'
  end

  get '/admin/products/:id/edit/' do
    product = Product.get(params[:id])
  end

  delete '/admin/products/:id/' do
    Product.get(params[:id]).destroy
    redirect '/admin/products/'
  end

  before '/admin/*' do
    User.authenticate!
  end

  after do
    session[:flash] = nil
  end

end
