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

class TopoSpaces < Sinatra::Base

  set :haml,   :format => :html5
  set :static, true

  # --------------------------------------------------------------------
  # Filters
  # --------------------------------------------------------------------
  before do
    @t = TopoSpace.new
    @t.docroot = File.join(File.dirname(__FILE__), "/test/fixtures")
  end

  before "/:id/*" do
    @c = Community.new(@t, params[:id]) 
  end

  # --------------------------------------------------------------------
  # Routes
  # --------------------------------------------------------------------
  get "/" do
    haml :toposet, :locals => {:content => @t.communities}
  end

  get "/:id/" do
    haml :toposet, :locals => {:content => @c.forums}
  end

  get "/:id/:f_id/" do
    f = Forum.new(@c, params[:f_id])
    haml :toposet, :locals => {:content => f.thoughts}
  end

  post "/f" do
    begin
      n = File.join(@@C_ROOT, "f", random_name)
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

# ---------------------------------------------------------------------
# A TopoSet is a typed collection of Points
# ---------------------------------------------------------------------
class TopoSet
  attr_accessor :name, :parent, :point_type
  attr_reader :id, :point_count, :root_space

  def initialize(an_id = nil)
    @id = an_id || random_name
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
# A Community is a TopoSet of Topics
# ---------------------------------------------------------------------
class Community < TopoSet
  
  def initialize(a_topospace = nil, an_id = nil)
    super(an_id)
    return if a_topospace.nil?
    raise ArgumentError if !(a_topospace.kind_of? TopoSpace)
    self.parent = a_topospace
  end

  def find(an_id)
    @id = an_id
  end

  def forums
    JSON.parse(File.read(File.join(self.parent.docroot, @id, "index")))
  end
end

# ---------------------------------------------------------------------
# A Forum is a TopoSet of Thoughts
# ---------------------------------------------------------------------
class Forum < TopoSet
  
  def initialize(a_community = nil, an_id = nil)
    super(an_id)
    return if a_community.nil?
    raise ArgumentError if !(a_community.kind_of? Community)
    self.parent = a_community
  end

  def thoughts
    @points
    #JSON.parse(File.read(File.join(self.parent.parent.docroot, self.parent.id, @id, "index")))
  end

end

# ---------------------------------------------------------------------
# A Thought is a single, short expression of an idea
# ---------------------------------------------------------------------
class Thought
  attr_accessor :body
end

# ---------------------------------------------------------------------
# A TopoSpace is a TopoSet of Communities
# ---------------------------------------------------------------------
class TopoSpace < TopoSet
 
  def << a_point
    @points << a_point
  end

  def communities
    if docroot
      return JSON.parse(File.read(File.join(self.docroot, "index")))
    end
    @points
  end
  
  def docroot
    @C_ROOT
  end

  def docroot= a_path
    @C_ROOT = a_path
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
