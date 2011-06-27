require 'sinatra'
require 'data_mapper'
require  'dm-migrations'
require File.expand_path('config', File.dirname(__FILE__))

class Product
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :resume, String
  property :description, Text
  property :created_at, DateTime

end

DataMapper.auto_upgrade!
