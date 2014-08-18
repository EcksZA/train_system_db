require 'pg'

require './lib/lines'
require './lib/stations'
require './lib/stops'
require './lib/trains'

puts "Welcome to the Train User Program."
puts "\n\n"

def main_menu
  puts "To view the stations a line passes through, press 's'"
  puts "To view the stations a train passes, press 't'"
  puts "To exit the use program, press 'q'"
  user_option = gets.chomp
  puts "\n"

  case user_option
  when 's'
    line_station
  when 't'
    train_station
  when 'q'
    puts "Thank you for using the Train User Program."
    exit
  else
    puts "That is not a valid option. Please try again."
    main_menu
  end
end

def line_station
  Line.all.each {|line| puts line.name}
  puts "Please enter the line, for which you want to see information"
  user_input = gets.chomp
  puts "\n"
  user_line = Line.all[Line.all.find_index {|line| line.name == user_input}]
  stations_of_line << user_line.stations
  stations_of_line.each {|station| puts station.name}
  puts "\n"
  puts "To view another line's stations, press 'v'"
  puts "To return to the main menu, press 'r'"
  user_option = gets.chomp
  puts "\n"
  case user_option
  when 'v'
    line_station
  when 'r'
    main_menu
  else
    puts "That is not a valid entry. The program will return to the main menu"
    main_menu
  end
end

main_menu
