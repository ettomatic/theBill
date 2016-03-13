require 'sinatra'

module Sky
  class App < Sinatra::Application
    set :root, File.join(File.dirname(__FILE__), '..', '..')
    set :views, Proc.new { File.join(root, 'views') }
    set :public_folder, Proc.new { File.join(root, 'public') }

    get '/my/bill' do
      data = BillRepository.find
      @bill = Bill.new(data)
      erb :bill
    end
  end
end
