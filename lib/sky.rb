module Sky; end

require 'bundler'
Bundler.require

require_relative 'sky/app'
require_relative 'sky/bill_repository'
require_relative 'sky/bill'

require 'dotenv'
Dotenv.load
