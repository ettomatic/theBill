$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'Sky'

run Sky::App.new
