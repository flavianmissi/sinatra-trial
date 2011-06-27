require File.expand_path('spec_helper', File.dirname(__FILE__))

describe 'TestApp' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'should get the index and be success' do
    get '/'
    last_response.status.should eql(200)
  end

  it 'should not fail' do
    true.should be_true
  end

end
