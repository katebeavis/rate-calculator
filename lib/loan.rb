class Loan
  INSUFFICIENT_FUNDS_ERROR_MESSAGE = "Insufficient funds available"
  LOAN_LENGTH = 36

  def funds_available(total_available)
    amount = ARGV[1].to_i
    if amount >= total_available
      INSUFFICIENT_FUNDS_ERROR_MESSAGE
    end
  end
  # find the amount available for the lowest interest rate
  def find_amount_matching_rate(available, index)
    available[index]
  end

  def get_remaining_amount(available, requested_amount, lowest_rate)
    requested_amount - available[lowest_rate]
  end

  def get_total_borrowed(requested_amount, get_remaining_amount)
    requested_amount - get_remaining_amount
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
      month_one_total = (month_one_total - principal).round(2)
    end
    arr
  end

  def monthly_interest_total(arr)
    arr.inject(0, &:+).round(2)
  end

  def total_repayment(total_borrowed, monthly_interest_total)
    total_borrowed + monthly_interest_total
  end

  def monthly_repayment_amount(total_repayment)
    (total_repayment / LOAN_LENGTH).round(2)
  end

  def principal_amount(total_borrowed)
    (total_borrowed / LOAN_LENGTH).round(2)
  end

  # find a given line
  def output_rate(data, index)
    data[index]['Rate'].to_f
  end
end
