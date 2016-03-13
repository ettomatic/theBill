$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'bill'
run Bill::App.new
