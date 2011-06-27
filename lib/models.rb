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

  def self.create_or_update(params)
    product = Product.first_or_create(params)
    product.save
  end
end

DataMapper.auto_upgrade!
