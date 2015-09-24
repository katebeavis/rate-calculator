require 'csv'
require './main'

class Info
  def initialize
    @main = Main.new
  end

  def read_file
    data = CSV.read(ARGV[0], headers: true)
    @requested_amount = ARGV[1].to_i
    @available = @main.total_available(data)
    puts @main.valid_request?(@requested_amount)
    # puts @main.available(data)
    # puts @main.rate(data)
  end
end

test = Info.new
test.read_file

    # puts "Requested Amount: #{@requested_amount}"
    # puts "Rate: %"
    # puts "Monthly Repayment:"
    # puts "Total Repayment:"

    # if !@main.valid_request?(@requested_amount)
    #   puts 'Please enter a valid loan amount'
    # end

    # if !@main.funds_available?(@requested_amount, @available)
    #   puts 'Insufficient funds available'
    # end
