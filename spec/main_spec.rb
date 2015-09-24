require 'spec_helper'

describe 'Main' do
  let(:main) { Main.new }
  let(:csv) { CSV.read('market.csv', headers: true) }
end
