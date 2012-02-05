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

describe 'TopoSpace Class' do
  before do
    @t = TopoSpace.new
  end

  it "is a type of TopoSet" do
    @t.class.must_equal TopoSpace
    @t.class.superclass.must_equal TopoSet
  end

  it "has a collection of Communities, intially empty" do
    @t.communities.must_be_empty
  end

  it "can have communities added to it" do
    @t << Community.new
    @t.communities.wont_be_empty
  end

  it "has a document root where its definitions is persisted" do
    @t.docroot.must_equal "#{File.join(File.dirname(__FILE__))}/fixtures"
  end

  it "can load itself from its persistence store" do
    @t.load.wont_be_empty
    end
end

