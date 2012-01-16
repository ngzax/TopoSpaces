require File.dirname(__FILE__) + '/test_helper'

require 'minitest/spec'
require 'minitest/autorun'

include Rack::Test::Methods

def app; TopoSpace; end

describe "Forums" do
  it "Can return a list of Forums at /f" do
    get "/f"
    last_response.wont_be_empty
  end
  
  it "Can return a list of Forums at /f" do
    get "/f"
    assert_equal "[{\"A\":0},{\"B\":0}]", last_response.body
  end
end

