class Main
  def available(data)
    data['Available'].map(&:to_i).inject(0, &:+)
  end

  def rate(data)
    data['Rate'].map(&:to_f)
  end

  def is_enough(amount, available)
    if amount > available
      puts 'Insufficient Funds'
    else
      puts 'Funds Available'
    end
  end
end