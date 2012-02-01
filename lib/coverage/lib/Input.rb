# Class representing single input
class Input
  attr_reader :m, :intervals

  def initialize(m, intervals)
    @m = m
    @intervals = intervals.sort
  end
end