require "./lib/Rectangle.rb"
require 'test/unit'

module Minimal

    class TestReader < Test::Unit::TestCase

        def test_intersects
            rect1 = Rectangle.new(4, 0, 0)
	    rect2 = Rectangle.new(2, 2, 2)

	    assert_equal(rect1.intersects?(rect2), true);
	    
	    rect1 = Rectangle.new(2, 5, 4)
	    rect2 = Rectangle.new(7, 8, 3)
	    
	    assert_equal(rect1.intersects?(rect2), true);
	    
	    rect1 = Rectangle.new(2, 9, 1)
	    rect2 = Rectangle.new(1, 2, 2)
	    
	    assert_equal(rect1.intersects?(rect2), false);
        end

	def test_area
	    rect1 = Rectangle.new(4, 0, 0)
	    rect2 = Rectangle.new(2, 2, 2)

	    assert_equal(rect1.common_area(rect2), 19);
	    
	    rect1 = Rectangle.new(2, 5, 4)
	    rect2 = Rectangle.new(7, 8, 3)

	    assert_equal(rect1.common_area(rect2), 48);
	    
	    rect1 = Rectangle.new(2, 9, 1)
	    rect2 = Rectangle.new(1, 2, 2)

	    assert_equal(rect1.common_area(rect2), 0);
	end



    end

end 