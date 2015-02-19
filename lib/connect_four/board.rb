module ConnectFour
  class Board
    attr_accessor :y_sub_x, :max_row, :max_col
  	attr_reader :grid
  	def initialize(input = {})
      @max_row = 6 # these should be changeable
      @max_col = 7 # these should be changeable      
  	  @grid = input.fetch(:grid, default_grid)
      @y_sub_x = Array.new(max_col,0) # there should be bounds on this
  	end


    def get_cell(x, y)
      return grid[y][x]
    end

    def push_cell(x, value)
      get_cell(x, y_sub_x[x]).value = value    
      y_sub_x[x] += 1
    end


    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

# placeholders til later
   def winner?
   end

# placeholders til later
   def draw?
   end

=begin
    def formatted_grid
    	grid.each do |row|
    		puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
        end
    end

    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
    end
=end
    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def subarray(x)
      #return nil if x.length != 7 || x.length != 6
      #  puts "subarray length == #{x.length}"
      #  return nil
      #end
      if x.length == 7
        return [ [x[0], x[1], x[2], x[3]], [x[1], x[2], x[3], x[4]], 
                 [x[2], x[3], x[4], x[5]], [x[3], x[4], x[5], x[6]] ]
      elsif x.length == 6
        return [ [x[0], x[1], x[2], x[3]], [x[1], x[2], x[3], x[4]], 
                 [x[2], x[3], x[4], x[5]] ]
      elsif x.length == 5
        return [ [x[0], x[1], x[2], x[3]], [x[1], x[2], x[3], x[4]] ]
      elsif x.length == 4
        return [ [x[0], x[1], x[2], x[3]] ]
      end
      return nil
    end

    private

    def default_grid
      Array.new(max_row) { Array.new(max_col) { Cell.new} }
    end

# grid needs to be decomposed into subarrays of length four.
# four each array of 7, break into 4 subarrays of 4
    def winning_positions
      t_grid = grid.transpose
      subarray(grid[0]) +
      subarray(grid[1]) +    
      subarray(grid[2]) +
      subarray(grid[3]) +    
      subarray(grid[4]) +
      subarray(grid[5]) +
      subarray(t_grid[0]) +
      subarray(t_grid[1]) +    
      subarray(t_grid[2]) +
      subarray(t_grid[3]) +    
      subarray(t_grid[4]) +
      subarray(t_grid[5])
      #grid #+ # rows
      #grid.transpose + # columns
      #diagonals # two diagonals
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

    def diagonals
      [
        [get_cell(3,5), get_cell(4,4), get_cell(5,3), get_cell(6,2)],
        [get_cell(2,5), get_cell(3,4), get_cell(4,3), get_cell(5,2), get_cell(6,1)],
        [get_cell(1,5), get_cell(2,4), get_cell(3,3), get_cell(4,2), get_cell(5,1), get_cell(6,0)],
        [get_cell(0,5), get_cell(1,4), get_cell(2,3), get_cell(3,2), get_cell(4,1), get_cell(5,0)],
        [get_cell(0,4), get_cell(1,3), get_cell(2,2), get_cell(3,1), get_cell(4,0)],
        [get_cell(0,3), get_cell(1,2), get_cell(2,1), get_cell(3,0)],
        [get_cell(0,2), get_cell(1,3), get_cell(2,4), get_cell(3,5)],
        [get_cell(0,1), get_cell(1,2), get_cell(2,3), get_cell(3,4), get_cell(4,5)],
        [get_cell(0,0), get_cell(1,1), get_cell(2,2), get_cell(3,3), get_cell(4,4), get_cell(5,5)],
        [get_cell(1,0), get_cell(2,1), get_cell(3,2), get_cell(4,3), get_cell(5,4), get_cell(6,5)],
        [get_cell(2,0), get_cell(3,1), get_cell(4,2), get_cell(5,3), get_cell(6,4)],
        [get_cell(3,0), get_cell(4,1), get_cell(5,2), get_cell(6,3)],        
      ]
    end

=begin
    def diagonals
      [
        [get_cell(0,0), get_cell(1,1), get_cell(2,2)],
        [get_cell(0,2), get_cell(1,1), get_cell(2,0)]
      ]
    end
=end


  end

end