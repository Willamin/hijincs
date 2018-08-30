struct Int32
  def self.from_digits(digits : Array(Int32))
    multiplier = 10
    digits.reverse.reduce do |accumulator, element|
      accumulator += element * multiplier
      multiplier *= 10
      accumulator
    end
  end

  def digits
    self.to_s.chars.map(&.to_i32)
  end
end
