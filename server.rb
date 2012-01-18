require "rubygems"

require "bundler/setup"
require "haml"
require "json"
require "sinatra"

C_ROOT = File.join(File.dirname(__FILE__), "community")

class TopoSpace < Sinatra::Base

  set :haml,   :format => :html5
  set :static, true
 
  get "/" do
    haml :index, :locals => {:content => Community.All}
  end

  get "/f" do
    haml :index, :locals => {:content => Forum.All}
  end

end

class Community
  def self.All
    JSON.parse(File.read(File.join(C_ROOT, "index"))).to_json
  end
end

class Forum
  def self.All
    JSON.parse(File.read(File.join(C_ROOT, "f", "index"))).to_json
  end
end
