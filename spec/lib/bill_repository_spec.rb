require 'spec_helper'

describe Sky::BillRepository do
  describe '.find' do
    let(:data) { { 'a' => 1 } }
    let(:resp) { double(parsed_response: data) }

    it 'fetch bills' do
      expect(described_class).to receive(:get).with('/bill.json', { timeout: 1 }).and_return(resp)
      expect(Sky::BillRepository.find).to eq data
    end
  end
end
