require 'spec_helper'

describe 'Loan' do
  let(:loan) { Loan.new }
  let(:csv) { CSV.read('market.csv', headers: true) }
  let(:lender) { Lender.new }
  available = [640, 480, 520, 170, 320, 140, 60]
  rate = 0.069
  principal = 27

  it 'calculates whether of not there are sufficient funds' do
    stub_const('ARGV', [csv, 100000])
    expect(loan.funds_available(500)).to eq("Insufficient funds available")
  end

#should use mocked data to show more cleary how the tests are working

  it 'can find the lowest rate and return the available amount' do
    stub_const('ARGV', [csv, 1000])
    index = lender.lowest_rate((lender.rate(csv)))
    expect(loan.find_amount(available, index)).to eq(480)
  end

  it 'calculates the total amount borrowed' do
    stub_const('ARGV', [csv, 1000])
    lowest_rate = lender.lowest_rate((lender.rate(csv)))
    expect(loan.get_correct_amount(available, ARGV[1], lowest_rate)).to eq(520)
  end

  it 'can calculate the principal amount' do
    stub_const('ARGV', [csv, 1000])
    expect(loan.principal_amount(ARGV[1])).to eq(27)
  end

  it 'can calculate the first months interest' do
    stub_const('ARGV', [csv, 1000])
    expect(loan.first_month(ARGV[1], rate)).to eq(5.75)
  end

  it 'can calculate the monthly interest for 36 months' do
    stub_const('ARGV', [csv, 1000])
    expect(loan.monthly_interest(ARGV[1], rate, principal)).to eq([5.72, 5.59, 5.44, 5.28, 5.13, 4.97, 4.82, 4.66, 4.51, 4.35, 4.2, 4.04, 3.89, 3.73, 3.58, 3.42, 3.27, 3.11, 2.96, 2.8, 2.65, 2.49, 2.33, 2.18, 2.02, 1.87, 1.71, 1.56, 1.4, 1.25, 1.09, 0.94, 0.78, 0.63, 0.47, 0.32])
  end

  it 'can calculate the sum of all interest' do
    stub_const('ARGV', [csv, 1000])
    arr = (loan.monthly_interest(ARGV[1], rate, principal))
    expect(loan.monthly_interest_total(arr)).to eq(109.16)
  end

#calculations are based on what has been requested not what has actually been borrowed

  it 'can calculate the total repayment' do
    stub_const('ARGV', [csv, 1000])
    monthly_interest_total = 109.16
    expect(loan.total_repayment(ARGV[1], monthly_interest_total)).to eq(1109.16)
  end

  it 'can calculate the monthly interest repayments' do
    stub_const('ARGV', [csv, 1000])
    total_repayment = 1109.16
    expect(loan.monthly_repayment_amount(total_repayment)).to eq(30.81)
  end
end
