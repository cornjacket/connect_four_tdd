# spec/cell_spec.rb
require "spec_helper"

module ConnectFour
  describe Game do
    # tests will be added here
    let(:bob) { Player.new({color: "X", name: "bob"}) }
    let(:frank) { Player.new({color: "O", name: "frank"}) }

    # not sure about the implementation of this test or
    # the reasoning behind it since it is stubbed. What
    # are we testing? Why?
    # the randomness has been stubbed out. 
    context "#initialize" do

      it "randomly selects a current_player" do
        Array.any_instance.stub(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.current_player).to eq frank
      end    

      it "randomly selects an other_player" do
        Array.any_instance.stub(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.other_player).to eq bob
      end    

    end # context "#initialize"

    context "#switch_players" do
      
     it "will set @current_player to @other_player" do
       game = Game.new([bob, frank])
       other_player = game.other_player
       game.switch_players
       expect(game.current_player).to eq other_player
     end

     it "will set @other_player to @current_player" do
       game = Game.new([bob, frank])
       current_player = game.current_player
       game.switch_players
       expect(game.other_player).to eq current_player
     end

    end # context "#switch_players"


    context "#solicit_move" do
      
     it "will ask the player to make a move" do
       game = Game.new([bob, frank])
       game.stub(:current_player) { bob }
       expected = "bob: Enter a number between 1 and 7 to make your move"
       expect(game.solicit_move).to eq expected
     end

    end # context "#solicit_move"

    context "#get_move" do
      
     it "converts human_move of '1' to 0" do
       game = Game.new([bob, frank])
       expect(game.get_move("1")).to eq 0
     end

     it "converts human_move of '7' to 6" do
       game = Game.new([bob, frank])
       expect(game.get_move("7")).to eq 6
     end

    end # context "#get_move"

    context "#game_over_message" do
      
     it "returns '{current_player name} won!' if board shows a winner" do
       game = Game.new([bob, frank])
       game.stub(:current_player) { bob }
       game.board.stub(:game_over) { :winner }
       expect(game.game_over_message).to eq "bob won!"
     end

     it "returns 'The game ended in a tie' if board shows a tie" do
       game = Game.new([bob, frank])
       game.stub(:current_player) { bob }
       game.board.stub(:game_over) { :draw }
       expect(game.game_over_message).to eq "The game ended in a tie"
     end

    end # context "#game_over_message"


  end
end