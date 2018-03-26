require_relative 'lib/messages'
require_relative 'lib/table'
require_relative 'lib/robot'



def place_robot(robot, table, input)
  # Get x, y, f from user_input
  start_array = input.sub('PLACE ', '').split(',')
  x = start_array[0].to_i
  y = start_array[1].to_i
  f = start_array[2]
  if table.valid?(x, y)
    robot.place(x,y,f, table)
  else
    puts 'Invalid position'
  end
end

def menu
  # Initialise robot and table
  # Tabletop
  table_length = 5
  table_width = 5
  table = Table.new(table_length, table_width)
  # init robot on table
  robot = Robot.new

  loop do
    if table.valid?(robot.x_position, robot.y_position)
      puts 'Enter a command (LEFT, RIGHT, MOVE, HELP, EXIT OR PLACE):'
    else
      puts WELCOME
    end

    user_input = gets.strip

    case user_input
    when 'HELP'
      puts INSTRUCTIONS
      gets
    when 'EXIT'
      puts "\nGoodbye!!\n\n"  
      abort
    when /^PLACE*/
      place_robot(robot, table, user_input)
    when 'MOVE'
      robot.move(table)
    when 'REPORT'
      robot.report(table)
    when 'LEFT', 'RIGHT'
      robot.turn(table, user_input)
    else
      puts 'I don\'t understand.'
    end
  end
end

menu
