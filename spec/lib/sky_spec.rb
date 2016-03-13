require 'spec_helper'

describe Sky::Bill do
  let(:json) do
    {
      statement: { due: '2015-01-25' },
      total: '59.99',
      package: { subscriptions: [{ type: 'tv', cost: '0.99' }] }
    }.to_json
  end

  subject { described_class.new(json) }

  it 'returns the bill total' do
    expect(subject.total).to eq '59.99'
  end

  it 'returns the statement data' do
    expect(subject.statement).to eq({ 'due' => '2015-01-25' })
  end

  it 'returns the subscriptions' do
    expect(subject.subscriptions[0]['cost']).to eq '0.99'
  end
end
