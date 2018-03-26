class Table
  def initialize(length, width)
    # Length is x, width is y?
    @length = length
    @width = width
  end

  attr_reader :length, :width, :directions

  def valid?(x, y)
    # returns true or false
    x && y && x.between?(0,self.length - 1) && y.between?(0,self.width - 1) 
  end
end