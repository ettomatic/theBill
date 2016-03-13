require_relative '../lib/sky'
require 'simplecov'
SimpleCov.start

require 'dotenv'

require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

stub_data = File.read(File.join('spec', 'test_data', 'bill.json'))

WebMock::API
  .stub_request(:get, %r[\/bill.json])
  .to_return(body: stub_data, headers: { 'Content-Type' => 'application/json' })
