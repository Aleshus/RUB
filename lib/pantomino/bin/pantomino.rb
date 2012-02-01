#!/usr/bin/ruby

require './lib/solver'


solver = Solver.new(ARGV[0].to_i, ARGV[1].to_i,ARGV[2].to_i, ARGV[3].to_i)
solver.solve
