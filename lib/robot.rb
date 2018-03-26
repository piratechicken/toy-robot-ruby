class Robot
  def initialize
    @available_directions = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  end
  attr_accessor :x_position, :y_position, :current_direction
  attr_reader :available_directions

  def place(x, y, f, table)
    if table.valid?(x,y) && @available_directions.include?(f)
      @x_position = x
      @y_position = y
      @current_direction = f || 'N' # Face north if no direction given
      puts "Robot placed at #{x},#{y} and facing #{f} on the #{table.length} by #{table.width} table."
    else
      puts "Invalid position"
    end
  end

  def move(table)
    case @current_direction
      when 'NORTH'
        new_x = @x_position
        new_y = @y_position + 1
      when 'SOUTH'
        new_x = @x_position
        new_y = @y_position - 1
      when 'EAST'
        new_x = @x_position + 1
        new_y = @y_position
      when 'WEST'
        new_x = @x_position - 1
        new_y = @y_position
    end
    if table.valid?(new_x, new_y)
      @x_position = new_x
      @y_position = new_y
    else
      puts "The robot can't move without going off the table"
    end
  end

  def turn(table, turn)
    current_direction_index = @available_directions.find_index(@current_direction)
    case turn
    when 'RIGHT'
      change_i = 1
    when 'LEFT'
      change_i = -1
    end
    new_index = (current_direction_index + change_i) % @available_directions.size
    @current_direction = @available_directions[new_index]
  end

  def report(table)
    if @x_position && @y_position
      puts "Robot is at #{@x_position},#{@y_position} and facing #{@current_direction} on the #{table.length} by #{table.width} table"
    else
      puts 'The robot does not appear to be on the table'
    end
  end
end