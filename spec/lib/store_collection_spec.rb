require 'spec_helper'

describe Sky::StoreCollection do
  let(:data) do
    {
      'rentals' => [
        { 'title' => '50 Shades of Grey', 'cost' => 4.99 }
      ],
      'buyAndKeep' => [
        { 'title' => "That's what she said", 'cost' => 9.99 },
      ],
      'total' => 24.97
    }
  end

  subject { described_class.new(data) }

  describe '#total' do
    it 'returns the total of the items composing the collection' do
      expect(subject.total).to eq('£ 24.97')
    end
  end

  describe '#items' do
    it 'returns an array of items' do
      expect(subject.items.size).to eq(2)
    end

    it 'returns the type' do
      expect(subject.items[1]['type']).to eq('purchases')
    end

    it 'returns costs in gbp' do
      expect(subject.items[0]['cost']).to eq('£ 4.99')
    end
  end
end
