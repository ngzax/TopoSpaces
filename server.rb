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

require "rubygems"

require "bundler/setup"
require "haml"
require "json"
require "sinatra"

C_ROOT = File.join(File.dirname(__FILE__), "test/fixtures")

class TopoSpace < Sinatra::Base

  set :haml,   :format => :html5
  set :static, true
 
  get "/" do
    haml :toposet, :locals => {:content => Community.All}
  end

  get "/:id/" do
    haml :toposet, :locals => {:content => Community.new(params[:id]).forums}
  end

  get "/:c_id/:f_id/" do
    haml :toposet, :locals => {:content => Forum.new(params[:f_id], params[:c_id]).discussions}
  end

  post "/f" do
    begin
      n = File.join(C_ROOT, "f", random_name)
      Dir.mkdir(n)
      File.open(File.join(n, "index"), "w+") { |f|
        forum = Forum.new(params[:name])
        f.puts("#{forum}") 
      }
    rescue
      return [500, "Forum Creation Failed."]
    end
  end
end

class Community
  def self.All
    JSON.parse(File.read(File.join(C_ROOT, "index")))
  end
  
  def initialize(id = nil)
    @id = id.nil? ? random_name : id
  end

  def forums
    JSON.parse(File.read(File.join(C_ROOT, @id, "index")))
  end
end

class Forum
  def initialize(id, community_id)
    @id = id
    @c_id = community_id
  end

  def discussions
    JSON.parse(File.read(File.join(C_ROOT, @c_id, @id, "index")))
  end
  
  def name
    @h[:name]
  end

  def to_s
    "{:forum=>#{@h}}"
  end
end

class TopoSet
  attr_accessor :name, :point_type
  attr_reader :id, :point_count

  def initialize
    @id = random_name
    @points = Array.new
  end

  def add_point(a_point)
    @points << a_point
  end

  def point_count
    @points.size
  end
end

# ---------------------------------------------------------------------
# Helper Methods
# ---------------------------------------------------------------------
def random_name
  "#{random_string(8)}-#{DateTime.now.strftime('%G%m%d%H%M')}"
end

def random_string(length)
  # http://stackoverflow.com/a/3572953/134495
  (36**(length-1) + rand(36**length)).to_s(36)
end
