#  TopoSpaces -- A Federated Discussion Server
#
#  Copyright (c) 2012, Daryl Richter
#  
#  Permission is hereby granted, free of charge, to any person obtaining
#  a copy of this software and associated documentation files (the
#  "Software"), to deal in the Software without restriction, including
#  without limitation the rights to use, copy, modify, merge, publish,
#  distribute, sublicense, and/or sell copies of the Software, and to
#  permit persons to whom the Software is furnished to do so, subject to
#  the following conditions:
#  
#  The above copyright notice and this permission notice shall be
#  included in all copies or substantial portions of the Software.
#  
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require File.dirname(__FILE__) + '/test_helper'

def app
  TopoSpace
end

#
# These are the tests for the TopoSpace class
#
describe 'TopoSet' do
  before do
    @t = TopoSet.new
  end

  it "always has a Random Name as its Id when created" do
    @t.id.must_match /([A-Za-z0-9]{8})[-]([0-9]{12})/
  end

  it "is not allowed to write to the id" do
    set_id = lambda { @t.id = 5 }
    set_id.must_raise NoMethodError 
  end

  it "can store the type of points in the TopoSet" do
    @t.point_type = 'Community'
    @t.point_type.must_equal 'Community'
  end
#  
#  it "Returns a list of Forums as JSON" do
#    get "/f"
#    last_response.body.must_include "{'forums':[{'id':'A', 'count':0},{'id':'B','count':0}]}"
#  end
#
#  it "can be created with a name" do
#    f = Forum.new 'Test'
#    f.name.must_equal 'Test'
#  end
#
#  it "prints out itself as a Hash" do
#    f = Forum.new 'Test'
#    f.to_s.must_equal "{:forum=>{:name=>\'Test\'}}"
#  end

#  it "creates a new Forum via POSTing to /f" do
#    post "/f", params = {:name => "Test Forum"}
#    assert last_response.ok?
#  end

end

