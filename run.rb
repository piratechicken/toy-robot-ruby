require_relative 'lib/messages'
require_relative 'lib/table'
require_relative 'lib/robot'

def control_robot(robot)
  puts 'Enter a command:'
  user_input = gets.strip

  case user_input
    when 'HELP'
      puts INSTRUCTIONS
      gets
      control_robot(robot)
    when 'EXIT'
      puts "\nGoodbye!!\n\n"  
      abort
    when 'MOVE'
      robot.move
      control_robot(robot)
    when 'REPORT'
      robot.report
      control_robot(robot)
    when 'LEFT', 'RIGHT'
      robot.turn(user_input)
      control_robot(robot)
    else
      puts 'I don\'t understand.'
      control_robot(robot)
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
  control_robot(robot)
end

def welcome_menu()
  puts WELCOME

  user_input = gets.strip

  case user_input
    when 'HELP'
      puts INSTRUCTIONS
      gets
      welcome_menu
    when 'EXIT'
      puts "\nGoodbye!!\n\n"  
      abort
    when /PLACE/
      start_robot(user_input)
    else
      puts 'I don\'t understand.'
      welcome_menu
  end
end

welcome_menu
