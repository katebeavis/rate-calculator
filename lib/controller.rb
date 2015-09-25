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
  INVALID_AMOUNT_ERROR_MESSAGE = 'Please enter your request in increments of 100'

  def calculate_quote
    @amount_lent = get_total_borrowed
    if error_messages
      puts error_messages
    else
      print_messages
    end
  end

  def print_messages
    puts "Requested Amount: #{@amount_lent}"
    puts "Rate: #{lowest_rate}%"
    puts "Monthly Repayment: #{monthly_repayment}"
    puts "Total Repayment: #{total_repayment}"
  end

  def error_messages
    if correct_parameters == false
      CORRECT_PARAMETERS_ERROR_MESSAGE
    elsif valid_request == false
      VALID_REQUEST_ERROR_MESSAGE
    elsif increment == false
      INVALID_AMOUNT_ERROR_MESSAGE   
    end
  end

  def valid_request
    amount = ARGV[1].to_i
    amount >= MINIMUM_LOAN_AMOUNT && amount <= MAXIMUM_LOAN_AMOUNT ? true : false
  end

  def correct_parameters
    ARGV.count != 2 ? false : true
  end

  def increment
    ARGV[1].to_i % 100 == 0 ? true : false
  end

  def available
    @lender.available(@csv)
  end

  def rate
    @lender.rate(@csv)
  end

  def lowest_rate
    @loan.output_rate(@csv, lowest_rate_index)
  end

  def lowest_rate_index
    @lender.lowest_rate(rate)
  end

  def find_amount_matching_rate
    @loan.find_amount_matching_rate(available, @lender.lowest_rate(rate))
  end

  def get_total_borrowed
    @loan.get_total_borrowed(ARGV[1].to_i, get_remaining_amount)
  end

  def get_remaining_amount
    @loan.get_remaining_amount(available, ARGV[1].to_i, lowest_rate_index)
  end

  def principal_amount
    @loan.principal_amount(@amount_lent)
  end

  def monthly_interest
    @loan.monthly_interest(@amount_lent, lowest_rate, principal_amount)
  end

  def monthly_interest_total
    @loan.monthly_interest_total(monthly_interest)
  end

  def monthly_repayment
    @loan.monthly_repayment_amount(total_repayment)
  end

  def total_repayment
    @loan.total_repayment(@amount_lent, monthly_interest_total)
  end
end

test = Controller.new
test.calculate_quote
