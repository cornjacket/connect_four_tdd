# For checking win and draw, the method will check an instance variable.
# The instance variable will be set whenever a new mark is made.
# Therefore after mark is made, a check will be made relative to the new
# mark whether the game is won or not. This will avoid a lot of needless
# checking of the board that is not possible due to the new move.
# however, this requires that get cel return an :invalid value for spaces
# off the map or not in play

module ConnectFour
  # Your code goes here...
end

require_relative "./connect_four/cell.rb"
require_relative "./connect_four/core_extensions.rb"
require_relative "./connect_four/board.rb"
require_relative "./connect_four/player.rb"
require_relative "./connect_four/game.rb"