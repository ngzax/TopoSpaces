Bundler.require :test

require File.expand_path(File.join(File.dirname(__FILE__), "../server"))

ENV['RACK_ENV'] = 'test'
