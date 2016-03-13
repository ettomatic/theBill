require 'sinatra'

module Bill
  class App < Sinatra::Application
    set :root, File.join(File.dirname(__FILE__), '..', '..')
    set :views, Proc.new { File.join(root, 'views') }

    get '/my/bill' do
      erb :bill
    end
  end
end
