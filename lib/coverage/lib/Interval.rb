class Interval
  attr_reader :start, :stop

  def initialize(start, stop)
    @start = start
    @stop = stop
  end

  include Comparable
  def <=>(interval)
    # more left than second interval
    return -1 if (@start < interval.start)
      
    # more right 
    return 1 if (@start > interval.start)
    
    #starts are probably the same!!
    
    #same interval
    return 0 if (@stop == interval.stop)
    
    # longer interval
    return -1 if (@stop < interval.stop)
        
    #shorter interval
    return 1 if (@stop > interval.stop)
  end

  def to_s
    @start.to_s + " " + @stop.to_s
  end
end
