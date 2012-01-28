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

describe "Random Strings" do
  before do
    @r = random_string(8)
  end

  it "can create a random string sized according to a passed integer" do
    @r.size.must_equal 8
  end

  it "can create a random string of letters and numbers" do
    @r.must_match /([A-Za-z0-9]{8})/
  end
end

describe "Random Names" do
  it "can create a random string of letters and numbers followed by a hyphen and then 12 digits representing yyyyMMddHHMM" do
    random_name.must_match /([A-Za-z0-9]{8})[-]([0-9]{12})/
  end
end

