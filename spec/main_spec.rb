require 'spec_helper'

describe 'Main' do
  let(:main) { Main.new }
  let(:csv) {CSV.read('market.csv', headers: true)}
  
  # it 'reads in a csv file' do
  #   expect(csv[0]).to eq([["Lender", "Bob"], ["Rate", "0.075"], ["Available", "640"]])
  # end

  # it 'calculates the total of money available to borrow' do
  #   stub_const("ARGV", [csv, 1000])
  #   expect(main.total_available(csv)).to eq(2330)
  # end

  # it 'raises an error when an amount less than the minimum loan amount is entered' do
  #   stub_const("ARGV", [csv, 100])
  #   expect(main.valid_request?(ARGV[1])).to eq(false)
  # end

  # it 'raises an error when an amount more than the maximum loan amount is entered' do
  #   stub_const("ARGV", [csv, 15050])
  #   expect(main.valid_request?(ARGV[1])).to eq(false)
  # end
end
