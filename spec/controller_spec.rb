require 'spec_helper'

describe 'Controller' do
  let(:controller) { Controller.new }
  let(:csv) { CSV.read('market.csv', headers: true) }

  context 'raising errors'
  it 'doesn\'t raise an error when a correct loan amount is entered' do
    stub_const('ARGV', [csv, 1000])
    expect(controller.valid_request).to eq(true)
  end

  it 'doesn\'t raise an error message when a correct loan amount is entered' do
    stub_const('ARGV', [csv, 1000])
    expect(controller.error_messages).not_to eq(Controller::VALID_REQUEST_ERROR_MESSAGE)
  end

  it 'raises an error when an amount less than the minimum loan amount is entered' do
    stub_const('ARGV', [csv, 100])
    expect(controller.valid_request).to eq(false)
  end

  it 'raises a message when an amount less than the minimum loan amount is entered' do
    stub_const('ARGV', [csv, 100])
    expect(controller.error_messages).to eq(Controller::VALID_REQUEST_ERROR_MESSAGE)
  end

  it 'raises an error when an amount more than the maximum loan amount is entered' do
    stub_const('ARGV', [csv, 15_050])
    expect(controller.valid_request).to eq(false)
  end

  it 'raises a message when an amount less than the minimum loan amount is entered' do
    stub_const('ARGV', [csv, 15_050])
    expect(controller.error_messages).to eq(Controller::VALID_REQUEST_ERROR_MESSAGE)
  end

  it 'raises an error when the incorrect amount of parameters are provided' do
    stub_const('ARGV', [csv])
    expect(controller.correct_parameters).to eq(false)
  end

  it 'raises a message when the incorrect amount of parameters are provided' do
    stub_const('ARGV', [csv])
    expect(controller.error_messages).to eq(Controller::CORRECT_PARAMETERS_ERROR_MESSAGE)
  end

  it 'doesn\'t raise an error when the correct amount of parameters are provided' do
    stub_const('ARGV', [csv, 1000])
    expect(controller.correct_parameters).to eq(true)
  end

  it 'doesn\'t raise a message when the correct amount of parameters are provided' do
    stub_const('ARGV', [csv, 1000])
    expect(controller.error_messages).not_to eq(Controller::CORRECT_PARAMETERS_ERROR_MESSAGE)
  end

  it 'raises an error when an incorrect increment is provided' do
    stub_const('ARGV', [csv, 1009])
    expect(controller.increment).to eq(false)
  end

  it 'raises a message when an incorrect increment is provided' do
    stub_const('ARGV', [csv, 1009])
    expect(controller.error_messages).to eq(Controller::INVALID_AMOUNT_ERROR_MESSAGE)
  end

  it 'doesn\'t raises an error when acorrect increment is provided' do
    stub_const('ARGV', [csv, 1000])
    expect(controller.increment).to eq(true)
  end

  it 'doesn\'t raises an message when acorrect increment is provided' do
    stub_const('ARGV', [csv, 1000])
    expect(controller.error_messages).not_to eq(Controller::INVALID_AMOUNT_ERROR_MESSAGE)
  end
end
