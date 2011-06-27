require File.join(File.dirname(__FILE__), '../lib', 'app.rb')
require 'sinatra'
require 'rack/test'
require 'rspec'

set :enviroment, :test

RSpec.configure do |config|
  config.before(:all) { DataMapper.auto_migrate! }
end
