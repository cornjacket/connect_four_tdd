module ConnectFour
  class Board
  	attr_reader :grid
  	def initialize(input = {})
  	  @grid = input.fetch(:grid, default_grid)
      @y_sub_x = Array.new(7,0) # there should be bounds on this, as well as accessor
  	end


    def get_cell(x, y)
      grid[y][x]
    end

    def push_cell(x, value)
      get_cell(x, @y_sub_x[x]).value = value
      @y_sub_x[x] += 1
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

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end
=end
    private

    def default_grid
      Array.new(6) { Array.new(7) { Cell.new} }
    end
=begin
    def winning_positions
      grid + # rows
      grid.transpose + # columns
      diagonals # two diagonals
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

    def diagonals
      [
        [get_cell(0,0), get_cell(1,1), get_cell(2,2)],
        [get_cell(0,2), get_cell(1,1), get_cell(2,0)]
      ]
    end
=end


  end

end