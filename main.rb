class Main
  MINIMUM_LOAN_AMOUNT = 1000
  MAXIMUM_LOAN_AMOUNT = 15000
  LOAN_LENGTH = 36

  def available(data)
    data['Available'].map(&:to_i)
  end

  def total_available(data)
    data['Available'].map(&:to_i).inject(0, &:+)
  end

  def rate(data)
    data['Rate'].map(&:to_f)
  end

  def funds_available?(amount, available)
    amount < available
  end

  def valid_request?(amount)
    amount >= MINIMUM_LOAN_AMOUNT && amount <= MAXIMUM_LOAN_AMOUNT
  end

  # find the index of the lowest interest rate
  def lowest_rate(rate)
    lowest_rate_index = rate.index(rate.min)
  end

  # find the amount available for the lowest interest rate
  def find_amount(available, index)
    available[index]
  end

  def get_correct_amount(available, requested_amount, lowest_rate_index)
    requested_amount - available[lowest_rate_index]
  end

  def first_month(total_borrowed, rate)
    (total_borrowed * rate) / 12
  end

  def monthly_interest(total_borrowed, rate, principal)
    puts month_one = (total_borrowed * rate) / 12
    puts month_one_total = (total_borrowed)
    for i in 1..36
      if i == 1
        puts month_one = (((month_one_total - month_one) * rate) / 12).round(2)
      else
    puts month_one = ((month_one_total * rate) / 12).round(2)
      end
    puts month_one_total = (month_one_total - principal).round(2)
  end
    # puts month_two_total = (month_one_total - month_one)
    # puts month_three = (((month_two_total - month_two) * rate) / 12).round(2)
    # puts month_three_total = (month_two_total - month_two)
    # puts month_four = (((month_three_total - month_three) * rate) / 12).round(2)
    # puts month_four_total = (month_three_total - month_three)
    # puts month_five = (((month_four_total - month_four) * rate) / 12).round(2)
    # puts month_five_total = (month_four_total - month_four)
    # puts month_six = (((month_five_total - month_five) * rate) / 12).round(2)
    # puts month_six_total = (month_five_total - month_five)
    # puts month_seven = (((month_six_total - month_six) * rate) / 12).round(2)
    # puts month_seven_total = (month_six_total - month_six)
    # puts month_eight = (((month_seven_total - month_seven) * rate) / 12).round(2)
    # puts month_eight_total = (month_seven_total - month_seven)
    # puts month_nine = (((month_eight_total - month_eight) * rate) / 12).round(2)
    # puts month_nine_total = (month_eight_total - month_eight)
  end

  def calculate_interest
  end

  def principal_amount(total_borrowed)
    total_borrowed / LOAN_LENGTH.round(2)
  end
  # find a given line
  def output_rate(data, index)
    data[index]['Rate'].to_f
  end
end
