require 'data_mapper'

#DataMapper
database_path = File.expand_path('../showcase.db', File.dirname(__FILE__))
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite:#{database_path}")

configure :test do
  database_path = File.expand_path('../test_showcase.db', File.dirname(__FILE__))
  DataMapper.setup(:default, "sqlite:#{database_path}")
end
