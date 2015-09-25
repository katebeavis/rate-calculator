class Lender
  def import_data
    data = CSV.read(ARGV[0], headers: true)
  end

  def available(data)
    data['Available'].map(&:to_i)
  end

  def total_available(data)
    total_available = data['Available'].map(&:to_i).inject(0, &:+)
  end

  def rate(data)
    data['Rate'].map(&:to_f)
  end

  def lowest_rate(rate)
    rate.index(rate.min)
  end
end
