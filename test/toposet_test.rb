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

#
# These are the tests for the TopoSpace class
#
describe 'TopoSets' do
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

  it "counts the number of point in the TopoSet" do
    @t.point_count.must_equal 0
    @t.add_point(Community.new(TopoSpace.new))
    @t.point_count.must_equal 1
  end

  it "is not allowed to write to the point_count" do
    set_pc = lambda { @t.point_count = 5 }
    set_pc.must_raise NoMethodError 
  end

  it "can be given a human readable name" do
    @t.name = 'a TopoSpace'
    @t.name.must_equal 'a TopoSpace'
  end
end

