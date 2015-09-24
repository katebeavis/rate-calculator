require 'csv'
require './main'

class Info
  def initialize
    @main = Main.new
  end

  def read_file
    data = CSV.read(ARGV[0], headers: true)
    puts @main.available(data)

    # @requested_amount = ARGV[1].to_i
    # puts "Requested Amount: #{@requested_amount}"
    # puts "Rate: %"
    # puts "Monthly Repayment:"
    # puts "Total Repayment:"
    # puts @main.is_enough(@requested_amount, @available)
  end
end

test = Info.new
test.read_file