class Robot
  def initialize(x,y,f,length, width)
    @x_position = x
    @y_position = y
    @direction = f
    # Add valid input check: integers and N/S/E/W
    @table = Table.new(length, width)
    if @table.valid?(x,y) 
      puts "Robot placed at #{x},#{y} and facing #{f} on the #{@table.length} by #{@table.width} table."
    else 
      puts "Robot can't be placed there!"
    end
  end

  attr_accessor :x_position, :y_position, :direction

  def move
    case self.direction
      when 'N'
        new_x = self.x_position
        new_y = self.y_position + 1
      when 'S'
        new_x = self.x_position
        new_y = self.y_position - 1
      when 'E'
        new_x = self.x_position + 1
        new_y = self.y_position
      when 'W'
        new_x = self.x_position - 1
        new_y = self.y_position
    end
    if @table.valid?(new_x, new_y)
      self.x_position = new_x
      self.y_position = new_y
    else
      puts "The robot can't move without going off the table"
    end
  end

  def turn(turn)
    current_direction_index = @table.directions.find_index(self.direction)
    case turn
    when 'RIGHT'
      change_i = 1
    when 'LEFT'
      change_i = -1
    end
    new_index = (current_direction_index + change_i) % @table.directions.size
    self.direction = @table.directions[new_index]
  end

  def report
    puts "Robot is at #{self.x_position},#{self.y_position} and facing #{self.direction} on the #{@table.length} by #{@table.width} table"
  end
end