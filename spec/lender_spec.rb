require 'spec_helper'

describe 'Lender' do
  let(:lender) { Lender.new }
  let(:csv) {CSV.read('market.csv', headers: true)}

  it 'reads in a csv file' do
    expect(csv[0]).to eq([["Lender", "Bob"], ["Rate", "0.075"], ["Available", "640"]])
  end
end