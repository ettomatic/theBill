require 'spec_helper'

describe Sky::Bill do
  let(:json) do
    {
      'statement' => {
        'due' => '2015-01-25',
        'generated' => '2015-01-11',
        'period' => { 'from' => '2015-01-26', 'to' => '2015-02-25' }
      },
      'total'     => 59.99,
      'package'   => { 'subscriptions' => [{ 'type' => 'tv', 'cost' => 0.99 }] }
    }
  end

  subject { described_class.new(json) }

  it 'returns the bill total' do
    expect(subject.total).to eq '£ 59.99'
  end

  it 'returns the bill due date' do
    expect(subject.due).to eq '25-01-2015'
  end

  it 'returns the generated date' do
    expect(subject.generated).to eq '11-01-2015'
  end

  it 'returns the starting date' do
    expect(subject.from).to eq '26 Jan'
  end

  it 'returns the ending date' do
    expect(subject.to).to eq '25 Feb'
  end

  it 'returns the subscriptions' do
    expect(subject.subscriptions[0]['cost']).to eq 0.99
  end
end
