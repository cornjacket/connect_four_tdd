#lib/connect_four/cell.rb
module ConnectFour
  class Cell
    attr_accessor :value
    def initialize(value = "")
      @value = value
    end
  end
end