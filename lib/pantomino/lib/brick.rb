
    class Brick

      attr_reader :slices, :id, :w, :h, :orientation, :size
      
        def initialize(w,h,orientation,id)
	    @size = w+h-1

	    @w = w
            @h = h
            @id = id
            @orientation = orientation

            @slices = Array.new(w)
            @slices.map! do |x|
                x = Array.new(h)
            end

	    if (orientation == :lt || orientation == :lb)
	      (0..@h-1).each { |y|
		@slices[0][y] = id
	      }
	    end

	    if (orientation == :rt || orientation == :rb)
	      (0..@h-1).each { |y|
		@slices[@w-1][y] = id
	      }
	    end

	    if (orientation == :lb || orientation == :rb)
	      (0..@w-1).each { |x|
		@slices[x][@h-1] = id
	      }
	    end

	    if (orientation == :lt || orientation == :rt)
	      (0..@w-1).each { |x|
		@slices[x][0] = id
	      }
	    end
	    

        end
    end
