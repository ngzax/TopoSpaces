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
  TopoSpaces
end

describe 'Communities' do
  before do
    @ts = TopoSpace.new
    @c = Community.new(@ts)
  end

  it "can be initially created using plain new without a TopoSpace" do
    c_create = lambda {Community.new}
    c_create.must_be_silent
  end

  it "has a Random Name as its Id when created without an id" do
    @c.id.must_match /([A-Za-z0-9]{8})[-]([0-9]{12})/
  end

  it "can be initially created with an id if you know an existing id" do
    c_create = lambda {Community.new(nil, "sdft76bn-201201252121")}
    c_create.must_be_silent
  end

  it "can be initially created as part of a TopoSpace" do
    c_create = lambda {@c1 = Community.new(@ts)}
    c_create.must_be_silent
    @c1.parent.must_be_same_as @ts
  end
  
  it "is a type of TopoSet" do
    @c.class.must_equal Community
    @c.class.superclass.must_equal TopoSet
  end
  
  it "has a connection back to its parent TopoSpace" do
    @c.parent.wont_be_nil
    @c.parent.must_be_same_as @ts
  end

#  it "can be loaded directly if you already know the id" do
#    c = Community.find("sdft76bn-201201252121")
#    c.wont_be_nil
#  end
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

