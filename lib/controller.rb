require 'csv'
require_relative 'loan'
require_relative 'lender'

class Controller
  def initialize
    @loan = Loan.new
    @lender = Lender.new
    @requested_amount = 0
    @csv = @lender.import_data
  end

  MINIMUM_LOAN_AMOUNT = 1000
  MAXIMUM_LOAN_AMOUNT = 15_000
  VALID_REQUEST_ERROR_MESSAGE = "Please enter an amount between #{MINIMUM_LOAN_AMOUNT} and #{MAXIMUM_LOAN_AMOUNT}"
  CORRECT_PARAMETERS_ERROR_MESSAGE = 'Please provide us with both the lender details and a loan amount'

  # HERE WILL BE ERROR MESSAGES AND RETURNING OF INFORMATION TO THE COMMAND LINE

  def read_file
    @requested_amount = ARGV[1].to_i
    @available = @lender.available(@lender.import_data)
    @loan.funds_available(@lender.total_available(@csv))
    puts "Requested Amount: #{@requested_amount}"
    @rate = @lender.rate(@csv)
    @lowest_rate_index = @lender.lowest_rate(@rate)
    @total_available = @lender.total_available(@csv)
    # @lowest_rate_index = @main.lowest_rate(@rate)
    @find_amount = @loan.find_amount(@available, @lender.lowest_rate(@rate))
    @lowest_rate = @loan.output_rate(@csv, @lowest_rate_index)
    @total_borrowed = @loan.get_correct_amount(@available, @requested_amount, @lender.lowest_rate(@rate))
    @principal_amount = @loan.principal_amount(@requested_amount)
    @monthly_interest = @loan.monthly_interest(@requested_amount, @lowest_rate, @principal_amount)
    puts "Rate: #{@lowest_rate}%"
    "Monthly Repayment: #{@monthly_repayment}"
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
end

test = Controller.new
test.read_file
test.valid_request
test.correct_parameters
# puts "Total Repayment:"
