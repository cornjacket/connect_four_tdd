# spec/player_spec.rb
require "spec_helper"

module ConnectFour
  describe Player do
    # tests will be added here

    context "#initialize" do

      it "raises an exception when intialized with {}" do
        expect { Player.new({}) }.to raise_error
      end   

      it "does not raise an exception when intialized with a valid input hash" do
        input = { color: "X", name: "Someone" }
        expect { Player.new(input) }.to_not raise_error
      end
    end # context "#initialize"

    context "#color" do
      it "returns the color" do
        input = { color: "X", name: "Someone "}
        player = Player.new(input)
        expect(player.color).to eq "X"
      end
    end # context #color

    context "#name" do
      it "returns the player's name" do
        input = { color: "X", name: "Someone"}
        player = Player.new(input)
        expect(player.name).to eq "Someone"
      end
    end # context #color

  end
end