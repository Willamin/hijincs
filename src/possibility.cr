class Possibility
  {% for x in %w(a b c d e h i j k) %}
  property {{x.id}} = 0
  {% end %}

  def subtrahend
    Int32.from_digits([a, b, c, d, e])
  end

  def minuend
    Int32.from_digits([h, i, j, c])
  end

  def difference
    Int32.from_digits([h, i, d, c, k])
  end

  def valid? : Bool
    subtrahend - minuend == difference
  end

  def initialize
  end

  def initialize(@a, @b, @c, @d, @e, @h, @i, @j, @k)
  end

  def to_s(io)
    io << subtrahend
    io << " - "
    io << minuend
    io << " == "
    io << difference
  end
end
