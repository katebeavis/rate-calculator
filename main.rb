class Main
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
    amount > 0
  end
end
