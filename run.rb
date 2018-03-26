require_relative 'lib/messages'
require_relative 'lib/table'
require_relative 'lib/robot'

def control_robot(robot)
  loop do
    puts 'Enter a command (LEFT, RIGHT, MOVE, HELP, EXIT):'
    user_input = gets.strip

    case user_input
    when 'HELP'
      puts INSTRUCTIONS
      gets
    when 'EXIT'
      puts "\nGoodbye!!\n\n"  
      abort
    when 'MOVE'
      robot.move
    when 'REPORT'
      robot.report
    when 'LEFT', 'RIGHT'
      robot.turn(user_input)
    else
      puts 'I don\'t understand.'
    end
  end
end

def start_robot(input)
  # Tabletop size
  table_length = 5
  table_width = 5
  # Get x, y, f from user_input
  start_array = input.sub('PLACE ', '').split(',')
  x = start_array[0].to_i
  y = start_array[1].to_i
  f = start_array[2]
  robot = Robot.new(x, y, f, table_length, table_width)
  if robot.table.valid?(x,y)
    control_robot(robot)
  else
    puts 'Robot must be placed on the table'
    welcome_menu
  end
end

def welcome_menu
  loop do
    puts WELCOME

    user_input = gets.strip

    case user_input
    when 'HELP'
      puts INSTRUCTIONS
      gets
    when 'EXIT'
      puts "\nGoodbye!!\n\n"  
      abort
    when /^PLACE*/
      start_robot(user_input)
    else
      puts 'I don\'t understand.'
    end
  end
end

welcome_menu
