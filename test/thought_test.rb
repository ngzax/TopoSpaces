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

#def app
#  TopoSpaces
#end

describe 'Thoughts' do
  before do
    @ts = TopoSpace.new
    @c = Community.new(@ts)
    @f = Forum.new(@c)
  end

  it "is NOT a type of TopoSet" do
    t = Thought.new
    t.class.must_equal Thought
    t.class.superclass.wont_equal TopoSet
  end

  it "can have a body which contains the text of the Thought" do
    t = Thought.new
    t.body = "This is a test"
    t.body.must_equal "This is a test"
  end

end

