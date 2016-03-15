module Sky; end

require 'bundler'
Bundler.require

require_relative 'sky/app'
require_relative 'sky/bill_repository'
require_relative 'sky/bill'
require_relative 'sky/collection'
require_relative 'sky/store_collection'

require 'dotenv'
Dotenv.load
