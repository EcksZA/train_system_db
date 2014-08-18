require 'pg'

require './lib/lines'
require './lib/stations'
require './lib/stops'
require './lib/trains'

DB = PG.connect(:dbname => "train_system_development")

puts "Welcome to the Train User Program."
puts "\n\n"

def main_menu
  puts "To view the stations a line passes through, press 's'"
  puts "To view the trains that pass through a station, press 't'"
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
  stations_of_line = user_line.stations
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

def train_station
  Station.all.each {|station| puts station.name}
  puts "Please enter a station to view the trains passing through"
  user_input = gets.chomp
  puts "\n"
  user_station = Station.all[Station.all.find_index {|station| station.name == user_input}]
  lines_of_station = user_station.lines
  lines_of_station.each do |line|
    Train.all.each do |train|
      if train.line_id == line.id
        puts train.name
      end
    end
  end

  puts "\n"
  puts "To view another station's trains, press 'v'"
  puts "To return to the main menu, press 'r'"
  user_option = gets.chomp
  puts "\n"
  case user_option
  when 'v'
    train_station
  when 'r'
    main_menu
  else
    puts "That is not a valid entry. The program will return to the main menu"
    main_menu
  end
end

main_menu
