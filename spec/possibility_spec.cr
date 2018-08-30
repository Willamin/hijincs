require "./spec_helper"

describe Possibility do
  test "that subtrahend works" do
    poss = Possibility.new
    poss.a = 1
    poss.b = 2
    poss.c = 3
    poss.d = 4
    poss.e = 5
    assert poss.subtrahend == 12345
  end

  test "that minuend works" do
    poss = Possibility.new
    poss.h = 1
    poss.i = 2
    poss.j = 3
    poss.c = 4
    assert poss.minuend == 1234
  end

  test "that difference works" do
    poss = Possibility.new
    poss.h = 1
    poss.i = 2
    poss.d = 3
    poss.c = 4
    poss.k = 5
    assert poss.difference == 12345
  end
end
