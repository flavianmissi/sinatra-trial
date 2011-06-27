require 'sinatra/base'
require 'rack-flash'
require 'haml'

require File.expand_path('common', File.dirname(__FILE__))
require File.expand_path('models', File.dirname(__FILE__))

class ShowCase < Sinatra::Base
  enable :sessions
  enable :method_override
  enable :static
  use Rack::Flash
  set :public, File.expand_path('../public', File.dirname(__FILE__))

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
    haml :'/admin/products/new'
  end

  post '/admin/products/new/' do
    if Product.create_or_update(params)
      flash[:notice] = "Product successfully created"
    else
      flash[:warning] = "Could not save the product."
    end
    redirect '/admin/products/'
  end

  get '/admin/products/:id/edit/' do
    @product = Product.get(params[:id])
    haml :'/admin/products/edit'
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
