require 'spec_helper'

describe 'Lender' do
  let(:lender) { Lender.new }
  let(:csv) { CSV.read('market.csv', headers: true) }

  it 'reads in a csv file' do
    expect(csv[0]).to eq([%w(Lender Bob), ['Rate', '0.075'], %w(Available 640)])
  end

  it 'returns an array of the individual sums of money available to the borrower' do
    expect(lender.available(csv)).to eq([640, 480, 520, 170, 320, 140, 60])
  end

  it 'returns an array of the interest rates available to the borrower' do
    expect(lender.rate(csv)).to eq([0.075, 0.069, 0.071, 0.104, 0.081, 0.074, 0.071])
  end

  it 'returns the total sum of the money available to the borrower' do
    expect(lender.total_available(csv)).to eq(2330)
  end

  it 'returns the lowest interest rate (via it\'s index)' do
    rates = [[8], [4], [7], [6]]
    expect(lender.lowest_rate((rates))).to eq(1)
  end
end
