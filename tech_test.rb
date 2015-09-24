require 'csv'
require './main'

class Info
  def initialize
    @main = Main.new
  end

  def read_file
    data = CSV.read(ARGV[0], headers: true)
    @requested_amount = ARGV[1].to_f
    @available = @main.available(data)
    @rate = @main.rate(data)
    @total_available = @main.total_available(data)
    @lowest_rate_index = @main.lowest_rate(@rate)
    @find_amount = @main.find_amount(@available, @lowest_rate_index)
    @lowest_rate = @main.output_rate(data, @lowest_rate_index)
    @total_borrowed = @main.get_correct_amount(@available, @requested_amount, @lowest_rate_index)
    @principal_amount = @main.principal_amount(@requested_amount)
    puts @principal_amount
    @monthly_interest = @main.monthly_interest(@requested_amount, @lowest_rate, @principal_amount)
    puts "Requested Amount: #{@requested_amount}"
    puts "Rate: #{@lowest_rate}%"
    puts "Monthly Repayment: #{@monthly_repayment}"
  end
end

test = Info.new
test.read_file

    # puts "Total Repayment:"

    # if !@main.valid_request?(@requested_amount)
    #   puts 'Please enter a valid loan amount'
    # end

    # if !@main.funds_available?(@requested_amount, @total_available)
    #   puts 'Insufficient funds available'
    # end
