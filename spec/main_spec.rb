require 'spec_helper'

describe 'Main' do
  subject { described_class.new }
  stub_const("ARGV[0]", ['market_file', 1000])
end

# it 'should do something' do
#   expect(subject.total_available(data)).to eq(2330)
# end
