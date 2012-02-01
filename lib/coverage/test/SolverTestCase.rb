require "./lib/Solver.rb"
require "./lib/Input.rb"
require "./lib/Interval.rb"
require 'test/unit'

module Minimal

    class TestReader < Test::Unit::TestCase

        def test_solver
	      intervals = Array.new
	      intervals.push(Interval.new(-1,0))
	      intervals.push(Interval.new(-5,-3))
	      intervals.push(Interval.new(2,5))
	      m = 1;
	      
	      solver = Solver.new
	      way = solver.solve(Input.new(m, intervals))
	      assert_equal(way,nil)
	      
	      intervals = Array.new
	      intervals.push(Interval.new(-2,5))
	      intervals.push(Interval.new(-1,-6))
	      intervals.push(Interval.new(-1,3))
	      intervals.push(Interval.new(0,4))
	      intervals.push(Interval.new(1,5))
	      intervals.push(Interval.new(2,6))
	      intervals.push(Interval.new(3,7))
	      intervals.push(Interval.new(8,10))
	      intervals.push(Interval.new(8,9))
	      m = 10;
	      
	      solver = Solver.new
	      way = solver.solve(Input.new(m, intervals))
	      assert_equal(way,nil)
	      
	      intervals = Array.new
	      intervals.push(Interval.new(-1,0))
	      intervals.push(Interval.new(0,1))
	      m = 1;
	      
	      solver = Solver.new
	      way = solver.solve(Input.new(m, intervals))
	      assert_equal(way,[1])
        end

	

    end

end 