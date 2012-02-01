require './lib/Input.rb'
require './lib/Interval.rb'
require './lib/Solver.rb'

# main program

input_count = gets.to_i
for i in (1..input_count)
  gets # empty line
  
  m = gets.to_i
  
  # read and prepare intervals
  intervals = Array.new
  while (true) do
    input = gets.split
    interval_start = input[0].to_i
    interval_stop = input[1].to_i
    
    break  if (interval_start == 0 && interval_stop == 0)
    
    intervals.push(Interval.new(interval_start, interval_stop))
  end
  
  solver = Solver.new
  input = Input.new(m, intervals)
  way = solver.solve(Input.new(m, intervals))
  
  unless (way.nil?)
      #print solution
      puts way.size.to_s
      way.each { |interval|
             puts input.intervals[interval]
           }
      puts
  else
    puts 0
  end  
  
  
  puts
end