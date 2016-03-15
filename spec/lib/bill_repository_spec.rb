require 'spec_helper'

describe Sky::BillRepository do
  describe '.find' do
    context 'success' do
      it 'fetch bills' do
        expected = JSON.parse File.read(File.join('spec', 'test_data', 'bill.json'))
        expect(Sky::BillRepository.find).to eq expected
      end
    end

    context 'failure' do
      before do
        stub_request(:get, %r[\/bill.json]).to_timeout
      end

      it 'handles timeouts' do
        expect { Sky::BillRepository.find }.to raise_error(Timeout::Error)
      end

      it 'handles 500s' do
        stub_request(:get, %r[\/bill.json]).to_return(:status => [500, 'Internal Server Error'])

        expect(Sky::BillRepository.find).to be_nil
      end
    end
  end
end
