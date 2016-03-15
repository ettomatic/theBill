require 'spec_helper'

describe Sky::Collection do
  let(:data) do
    {
      'subscriptions' => [
        { 'type' => 'tv', 'name' => 'Variety with Movies HD', 'cost' => 50.00 },
        { 'type' => 'talk', 'name' => 'Sky Talk Anytime', 'cost' => 5.00 }
      ],
      'total' => '71.40'
    }
  end

  subject { described_class.new(data: data, type: 'subscriptions') }

  describe '#total' do
    it 'returns the total of the items composing the collection' do
      expect(subject.total).to eq('£ 71.40')
    end
  end

  describe '#items' do
    it 'returns an array of items' do
      expect(subject.items.size).to eq(2)
    end

    it 'returns costs in gbp' do
      expect(subject.items[0]['cost']).to eq('£ 50.00')
    end
  end
end
