require 'sinatra'

module Sky
  class App < Sinatra::Application
    set :root, File.join(File.dirname(__FILE__), '..', '..')
    set :views, Proc.new { File.join(root, 'views') }
    set :public_folder, Proc.new { File.join(root, 'public') }

    get '/my/bill' do
      data = BillRepository.find
      if data
        @bill = Bill.new(data)
        erb :bill
      else
        [500, "We're experiencing technical difficulties at the moment, please try later"]
      end
    end
  end
end
