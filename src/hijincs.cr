require "./*"
require "benchmark"

module Hijincs
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
  PROBLEM = <<-P
       ABCDE
      - HIJC
    --------
    =  HIDCK

  P

  def self.calculate
    answers = [] of Possibility
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].each_permutation(reuse: true) do |perm|
      perm = perm[0..-2]
      poss = Possibility.new
      {% for x, y in %w(a b c d e h i j k) %}
      poss.{{x.id}} = perm[{{y.id}}]
      {% end %}

      if poss.valid?
        answers << poss
      end
    end
    answers
  end
end

case ARGV[0]?
when "bm"
  Benchmark.bm do |x|
    50.times do
      x.report("benchmark:") { Hijincs.calculate }
    end
  end
when "answers"
  Hijincs.calculate.each { |x| puts x }
else
  puts "command should be 'bm' or 'answers'"
end
