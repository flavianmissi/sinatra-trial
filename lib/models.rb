require 'sinatra'
require 'data_mapper'
require  'dm-migrations'

database_path = File.expand_path('../showcase.db', File.dirname(__FILE__))
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite:#{database_path}")

class Product
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :resume, String
  property :description, Text
  property :created_at, DateTime
end

DataMapper.auto_upgrade!
