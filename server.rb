require "rubygems"

require "bundler/setup"
require "json"
require "sinatra"

#$LOAD_PATH.unshift(File.dirname(__FILE__))
#SINATRA_ROOT = File.expand_path(File.dirname(__FILE__))
#APP_ROOT = File.expand_path(File.join(SINATRA_ROOT, "..", ".."))

class TopoSpace < Sinatra::Base
  get "/" do
    "Hello world, it's #{Time.now} at the server!"
  end

  get "/f" do
    "#{Forum.All}"
  end
end

class Forum
  def self.All
    f = Array.new
    f << {A: 0}
    f << {B: 0}
    f.to_json
  end
end
