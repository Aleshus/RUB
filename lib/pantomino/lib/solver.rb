require './lib/brick'
require './lib/board'

    class Solver

        def initialize(brick_width,brick_height,board_width,board_height)
            @board = Board.new(board_width,board_height)
            @w = brick_width
            @h = brick_height

            @variants = @w == @h ? [0] : [0,1]
        end

	def solve
            result = find_solution(@board.clone,1)
            if result == :failed
                puts "Solution has not been found!"
		return :failed
            else
		result.render
		return :solutionFound
            end
        end

	
        def find_solution(board,id)
            x,y = board.free_cell
	    for variant in @variants do
                w = variant == 1 ? @w : @h
                h = variant == 1 ? @h : @w
		
                for orientation in [:lt,:lb,:rt,:rb] do
                    new_board = board.clone
		    new_brick = Brick.new(w,h,orientation,id)
		    inserted = new_board.insert(new_brick,  orientation == :rb ? x-w+1 : x,y)
                    if ( inserted )
                        return new_board if new_board.done?
                        if (result = find_solution(new_board,id+1)) != :failed then return result end
                    end
                end
            end

            
            return :failed

        end



    end
