# spec/cell_spec.rb
require "spec_helper"


  describe Array do
    # tests will be added here

    context "#all_empty?" do
      it "returns true if all elements of the Array are empty" do
        expect(["", "", ""].all_empty?).to be_truthy
      end

      it "returns false if some of the Array elements are not empty" do
        expect(["", 1, Object.new, :a].all_empty?).to be_falsy
      end      
    
      it "returns true for an empty Array" do
        expect([].all_empty?).to be_truthy
      end

    end # context "#all_empty?"



    context "#all_same?" do
      it "returns true if all elements of the Array are the all_same" do
        expect(["A", "A", "A"].all_same?).to be_truthy
      end

      it "returns false if all of the Array elements are not same" do
        expect(["", 1, Object.new, :a].all_same?).to be_falsy
      end      
    
      it "returns true for an empty Array" do
        expect([].all_same?).to be_truthy
      end

    end # context "#all_same?"



    context "#any_empty?" do
      it "returns false if all elements of the Array are not empty" do
        expect(["A", "A", "A"].any_empty?).to be_falsy
      end

      it "returns true if at least one of the Array elements are empty" do
        expect(["", 1, Object.new, :a].any_empty?).to be_truthy
      end      
    
      #it "returns true for an empty Array" do
      #  expect([].any_empty?).to be_truthy
      #end

    end # context "#any_empty?"


    context "#none_empty?" do
      it "returns true if none of the elements of the Array are empty" do
        expect(["A", "A", "A"].none_empty?).to be_truthy
      end

      it "returns false if at least one of the Array elements are empty" do
        expect(["", 1, Object.new, :a].none_empty?).to be_falsy
      end         

    end # context "#none_empty?"

  end