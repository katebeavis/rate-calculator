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
    month_one = (total_borrowed * rate) / 12
    month_one_total = (total_borrowed)
    arr = []
    for i in 1..36
      if i == 1
        arr << month_one = (((month_one_total - month_one) * rate) / 12).round(2)
      else
        arr << month_one = ((month_one_total * rate) / 12).round(2)
      end
      arr << month_one_total = (month_one_total - principal).round(2)
    end
    puts arr.inspect
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
