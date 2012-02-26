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

Bundler.require :test

include Rack::Test::Methods

ENV['RACK_ENV'] = 'test'

require File.expand_path(File.join(File.dirname(__FILE__), "../server"))

require 'minitest/spec'
require 'minitest/autorun'

# This is for RubyMine
#require 'minitest/reporters'
#MiniTest::Unit.runner = MiniTest::SuiteRunner.new
#if ENV["RM_INFO"] || ENV["TEAMCITY_VERSION"]
#  MiniTest::Unit.runner.reporters << MiniTest::Reporters::RubyMineReporter.new
#elsif ENV['TM_PID']
#  MiniTest::Unit.runner.reporters << MiniTest::Reporters::RubyMateReporter.new
#else
#  MiniTest::Unit.runner.reporters << MiniTest::Reporters::ProgressReporter.new
#end
