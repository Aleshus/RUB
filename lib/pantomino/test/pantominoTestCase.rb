require "./lib/solver.rb"
require 'test/unit'

class TestPantomino < Test::Unit::TestCase

        def test_solution
            solver = Solver.new(3, 2,8, 9)
	    assert_equal(solver.solve, :solutionFound)
	    
	    solver = Solver.new(3, 8,8, 9)
	    assert_equal(solver.solve, :failed)
	    
	    solver = Solver.new(5, 8,8, 9)
	    assert_equal(solver.solve, :failed)
	    
	    solver = Solver.new(5, 1,8, 2)
	    assert_equal(solver.solve, :failed)
	    
	    solver = Solver.new(1, 9,5, 1)
	    assert_equal(solver.solve, :failed)
	    
	    solver = Solver.new(6, 4,16, 18)
	    assert_equal(solver.solve, :failed)
	    
	    solver = Solver.new(2, 3,6, 4)
	    assert_equal(solver.solve, :solutionFound)
        end

end 