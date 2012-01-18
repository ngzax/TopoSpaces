Bundler.require :test

require File.expand_path(File.join(File.dirname(__FILE__), "../server"))

require 'minitest/spec'
require 'minitest/autorun'

include Rack::Test::Methods

ENV['RACK_ENV'] = 'test'
