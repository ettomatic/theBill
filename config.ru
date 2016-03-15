$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'sky'

run Sky::App.new
