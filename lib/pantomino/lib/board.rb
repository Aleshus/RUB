class Board
    protected
    attr_accessor :desk, :free

    public
    attr_reader :w, :h

    def initialize(width,height)

	@w = width.to_i
	@h = height.to_i
	@desk = Array.new(w)
	@desk.map! { |x| x = Array.new(h) }

	@free = w*h

    end

    def done?
	@free == 0
    end

    def clone
	desk = Board.new(@w,@h)
	desk.desk = Array.new(@w)
	cols = @desk.each
	desk.desk.map! { |x| x = cols.next.dup}
	desk.free = @free
	return desk
    end

    def collision?(brick,from_x,from_y,changes)

	return true if brick.size > free
	return true if from_x + brick.w > @w
	return true if from_y + brick.h > @h

	x_off = 0
	for x in brick.slices do
	    y_off = 0
	    for id in x do
		if id != nil
		    if @desk[from_x + x_off][from_y + y_off] == nil
			changes << [from_x + x_off,from_y + y_off]
		    else
			return true
		    end
		end
		y_off += 1
	    end
	    x_off += 1
	end

	return false
    end

    def insert(brick,from_x,from_y)
	changes = []
	return false if collision?(brick,from_x,from_y,changes)

	for i in changes do
	    @desk[i[0]][i[1]] = brick.id
	    @free -= 1
	end

	return true

    end

    def free_cell
	(0..@h-1).each { |y|
	                 (0..@w-1).each { |x|
	                                  return x,y if @desk[x][y] == nil
	                                }
	               }
    end

    def render
	print " _"
	for x in 1...@w do
	    print "__"
	end
	puts

	for y in 0...@h do
	    for x in 0...@w do
		if x == 0
		    print "|"
		end

		down_flag = false


		if @desk[x] != nil && @desk[x][y+1] != @desk[x][y] || y == @h - 1
		    print "_"
		    down_flag = true
		else
		    print " "
		end
		if @desk[x+1] != nil && @desk[x+1][y] != @desk[x][y] || x == @w - 1
		    print "|"
		else
		    if down_flag
			if @desk[x+1] != nil && @desk[x+1][y+1] != @desk[x][y+1]
			    print " "
			else
			    print "_"
			end
		    else
			print " "
		    end
		end
	    end

	    puts
	end
    end

end
