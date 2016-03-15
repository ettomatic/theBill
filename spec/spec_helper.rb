require_relative '../lib/sky'
require 'simplecov'
SimpleCov.start

require 'dotenv'

require 'webmock/rspec'

stub_data = File.read(File.join('spec', 'test_data', 'bill.json'))
WebMock.disable_net_connect!(allow_localhost: false)

RSpec.configure do |config|
  config.before do
    stub_request(:get, %r[\/bill.json])
     .to_return(body: stub_data, headers: { 'Content-Type' => 'application/json' })
  end
end
