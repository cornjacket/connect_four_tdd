# spec/cell_spec.rb
require "spec_helper"

module ConnectFour
  describe Board do
    # tests will be added here

    context "#initialize" do
      it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end    
  
    end # context "#initialize"


    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "blah")
        expect(board.grid).to eq "blah"
      end
    end

    context "get_cell" do
      it "returns the cell based on the (x,y) coordinate" do
        grid = [ ["", "", "", ""], ["", "", "something", ""], ["", "", "", ""] ]
        board = Board.new(grid: grid)
        expect(board.get_cell(2,1)).to eq "something"
      end

     
    end

    context "#push_cell" do

      it "it updates the value of the cell object at a (x,0) coordinate" do
        Cat = Struct.new(:value)
        grid = [ [Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""] ]
        board = Board.new(grid: grid)
        board.push_cell(0,"meow")
        expect(board.get_cell(0,0).value).to eq "meow"
      end

      it "it updates the value of the cell object at a (x,1) coordinate after 2nd call to push_cell" do
        Dog = Struct.new(:value)
        grid = [ [Cat.new("cool"), "", ""], [Dog.new("cool"), "", ""], ["", "", ""] ]        
        board = Board.new(grid: grid)
        board.push_cell(0,"meow")
        board.push_cell(0,"bark")
        expect(board.get_cell(0,1).value).to eq "bark"
      end

      it "it updates the value of the cell object at a (x,2) coordinate after 3rd call to push_cell" do
        Bird = Struct.new(:value)
        grid = [ [Cat.new("cool"), "", ""], [Dog.new("cool"), "", ""], [Bird.new("cool"), "", ""] ]          
        board = Board.new(grid: grid)
        board.push_cell(0,"meow")
        board.push_cell(0,"bark")
        board.push_cell(0,"tweet")
        expect(board.get_cell(0,2).value).to eq "tweet"
      end

    end

    context "#subarray" do

      it "returns nil if it is passed any array with length < 4" do
        board = Board.new
        ary = [1, 2, 3]
        expect(board.subarray(ary)).to eq nil
      end

      it "returns nil if it is passed any array with length > 7" do
        board = Board.new
        ary = [1, 2, 3, 4, 5, 6, 7, 8]
        expect(board.subarray(ary)).to eq nil
      end

      it "returns an array of length 1 when given array of 4 elements" do
        board = Board.new
        ary = [1, 2, 3, 4]
        expect(board.subarray(ary).length).to eq 1
      end

      it "returns an array of length 2 when given array of 5 elements" do
        board = Board.new
        ary = [1, 2, 3, 4, 5]
        expect(board.subarray(ary).length).to eq 2
      end

      it "returns an array of length 3 when given array of 6 elements" do
        board = Board.new
        ary = [1, 2, 3, 4, 5, 6]
        expect(board.subarray(ary).length).to eq 3
      end

      it "returns an array of length 4 when given array of 7 elements" do
        board = Board.new
        ary = [1, 2, 3, 4, 5, 6, 7]
        expect(board.subarray(ary).length).to eq 4
      end

      it "returns 4 subarrays of values with incrementing start index when given array of 7 elements" do
        board = Board.new
        ary = [1, 2, 3, 4, 5, 6, 7]
        expect(board.subarray(ary)).to eq [ [1,2,3,4], [2,3,4,5], [3,4,5,6], [4,5,6,7] ]
      end      
   
      it "returns 3 subarrays of values with incrementing start index when given array of 6 elements" do
        board = Board.new
        ary = [1, 2, 3, 4, 5, 6]
        expect(board.subarray(ary)).to eq [ [1,2,3,4], [2,3,4,5], [3,4,5,6] ]
      end

    end

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new }


    context "#game_over" do
      it "it returns :winner if winner? is true" do
        board = Board.new
        board.stub(:winner?) { true }
        expect(board.game_over).to eq :winner
      end

      it "it returns :draw if winner? is false and draw? is true" do
        board = Board.new
        board.stub(:winner?) { false }
        board.stub(:draw?) { true }
        expect(board.game_over).to eq :draw
      end

      it "it returns false if winner? is false and draw? is false" do
        board = Board.new
        board.stub(:winner?) { false }
        board.stub(:draw?) { false }
        expect(board.game_over).to be_falsy
      end


      it "returns :winner when row has 4 objects with values that are the same" do
        grid = [
        [x_cell, x_cell, x_cell, empty,  empty, empty, empty],
        [y_cell, x_cell, y_cell, empty,  empty, empty, empty],
        [x_cell, y_cell, x_cell, empty,  empty, empty, empty],
        [y_cell, x_cell, y_cell, empty,  empty, empty, empty],
        [x_cell, y_cell, x_cell, empty,  empty, empty, empty],
        [y_cell, y_cell, y_cell, y_cell, empty, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when a column has 4 objects with values that are the same" do
        grid = [
        [x_cell, x_cell, x_cell, empty,  empty, empty, empty],
        [y_cell, x_cell, y_cell, empty,  empty, empty, empty],
        [x_cell, y_cell, x_cell, empty,  empty, empty, empty],
        [y_cell, x_cell, x_cell, empty,  empty, empty, empty],
        [x_cell, y_cell, x_cell, empty,  empty, empty, empty],
        [y_cell, y_cell, x_cell, y_cell, empty, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end 

      it "returns :winner when diagonal has objects with values that are the same" do
        grid = [
        [x_cell, x_cell, x_cell, empty,  empty, empty, empty],
        [y_cell, x_cell, y_cell, empty,  empty, empty, empty],
        [x_cell, y_cell, x_cell, empty,  empty, empty, empty],
        [y_cell, x_cell, y_cell, x_cell, empty, empty, empty],
        [x_cell, y_cell, x_cell, empty,  empty, empty, empty],
        [y_cell, y_cell, x_cell, y_cell, empty, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end   


      it "returns :draw when all spaces on the board are taken" do
        grid = [
        [x_cell, x_cell, x_cell, y_cell, y_cell, y_cell, x_cell],
        [y_cell, x_cell, y_cell, y_cell, x_cell, y_cell, x_cell],
        [x_cell, y_cell, x_cell, x_cell, y_cell, y_cell, y_cell],
        [x_cell, x_cell, y_cell, y_cell, x_cell, x_cell, x_cell],
        [x_cell, y_cell, x_cell, x_cell, x_cell, y_cell, y_cell],
        [y_cell, y_cell, x_cell, y_cell, y_cell, y_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end
=begin
      it "returns falsy when there is no winner or draw" do
        grid = [
        [x_cell, empty, empty],
        [y_cell, empty, empty],
        [y_cell, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to be_falsy
      end
=end
    end # context #game_over

  end
end