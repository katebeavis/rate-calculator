require 'csv'
require_relative 'main'
require_relative 'lender'

class Controller
  def initialize
    @main = Main.new
    @lender = Lender.new
    @requested_amount = 0
  end

  MINIMUM_LOAN_AMOUNT = 1000
  MAXIMUM_LOAN_AMOUNT = 15_000
  VALID_REQUEST_ERROR_MESSAGE = "Please enter an amount between #{MINIMUM_LOAN_AMOUNT} and #{MAXIMUM_LOAN_AMOUNT}"
  CORRECT_PARAMETERS_ERROR_MESSAGE = 'Please provide us with both the lender details and a loan amount'

  # HERE WILL BE ERROR MESSAGES AND RETURNING OF INFORMATION TO THE COMMAND LINE

  def read_file
    @requested_amount = ARGV[1].to_i
    @available = @lender.available(@lender.import_data)
    # @rate = @main.rate(data)
    # puts @total_available = @main.total_available(data)
    # @lowest_rate_index = @main.lowest_rate(@rate)
    # @find_amount = @main.find_amount(@available, @lowest_rate_index)
    # @lowest_rate = @main.output_rate(data, @lowest_rate_index)
    # @total_borrowed = @main.get_correct_amount(@available, @requested_amount, @lowest_rate_index)
    # @principal_amount = @main.principal_amount(@requested_amount)
    # @monthly_interest = @main.monthly_interest(@requested_amount, @lowest_rate, @principal_amount)
    # puts "Requested Amount: #{@requested_amount}"
    # puts "Rate: #{@lowest_rate}%"
    # puts "Monthly Repayment: #{@monthly_repayment}"
    # puts valid_request
    # puts correct_parameters
    puts error_messages
  end

  def error_messages
    if correct_parameters == false
      CORRECT_PARAMETERS_ERROR_MESSAGE
    elsif valid_request == false
      VALID_REQUEST_ERROR_MESSAGE
    end
  end

  def valid_request
    amount = ARGV[1].to_i
    amount >= MINIMUM_LOAN_AMOUNT && amount <= MAXIMUM_LOAN_AMOUNT ? true : false
  end

  def correct_parameters
    ARGV.count != 2 ? false : true
  end

  def funds_available?(amount, available)
    amount < available
  end
end

test = Controller.new
# test.read_file
# test.valid_request
# test.correct_parameters
# puts "Total Repayment:"

# if !@main.valid_request?(@requested_amount)
#   puts 'Please enter a valid loan amount'
# end

# if !@main.funds_available?(@requested_amount, @total_available)
#   puts 'Insufficient funds available'
# end
