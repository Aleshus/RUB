require "./lib/Interval.rb"
require 'test/unit'

module Minimal

    class TestReader < Test::Unit::TestCase

        def test_comp
            assert_equal(Interval.new(0,3).<=>(Interval.new(10,33)), -1)
	    assert_equal(Interval.new(2,3).<=>(Interval.new(2,5)), -1)
	    assert_equal(Interval.new(-5,8).<=>(Interval.new(4,8)), -1)
	    assert_equal(Interval.new(8,15).<=>(Interval.new(-4,45)), 1)
	    assert_equal(Interval.new(1,3).<=>(Interval.new(0,1)), 1)
	    assert_equal(Interval.new(8,8).<=>(Interval.new(8,1)), 1)
	    assert_equal(Interval.new(15,7).<=>(Interval.new(-4,5)), 1)
	    assert_equal(Interval.new(6,3).<=>(Interval.new(6,22)), -1)
	    assert_equal(Interval.new(7,8).<=>(Interval.new(9,22)), -1)
	    assert_equal(Interval.new(2,6).<=>(Interval.new(8,7)), -1)
	    assert_equal(Interval.new(2,6).<=>(Interval.new(2,6)), 0)
        end

    end

end 