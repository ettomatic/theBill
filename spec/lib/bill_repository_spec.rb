require 'spec_helper'

describe Sky::BillRepository do
  describe '.find' do
    it 'fetch bills' do
      expected = JSON.parse File.read(File.join('spec', 'test_data', 'bill.json'))
      expect(Sky::BillRepository.find).to eq expected
    end
  end
end
