$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'Sky'
require 'dotenv'
Dotenv.load

run Sky::App.new
