# lib/connect_four/game.rb
module ConnectFour
  class Game
  	attr_reader :players, :board, :current_player, :other_player
  	
  	def initialize(players, board = Board.new)
  	  @players = players
  	  @board = board
  	  @current_player, @other_player = players.shuffle
  	end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "#{current_player.name}: Enter a number between 1 and 7 to make your move"
    end

    def get_move(human_move = gets.chomp)
      human_move_to_coordinate(human_move)
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie" if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} has randomly been selected as the first player"
      while true
        board.formatted_grid
        puts ""
        puts solicit_move
        x = get_move
        board.push_cell(x, current_player.color)
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end      
    end

    private

    def human_move_to_coordinate(human_move)
      mapping = {
        "1" => 0,
        "2" => 1,
        "3" => 2,
        "4" => 3,
        "5" => 4,
        "6" => 5,
        "7" => 6,
        "8" => 7
      }
      mapping[human_move]
    end

  end # Game
end