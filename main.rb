class Main
  def available(data)
    data['Available'].map(&:to_i).inject(0, &:+)
  end

  def rate(data)
    data.each do |row|
      puts row[1].to_f
    end
  end

  # def is_enough(amount, available)
  #   if amount > available
  #     puts 'Insufficient Funds'
  #   else
  #     puts 'bye'
  #   end
  # end
end