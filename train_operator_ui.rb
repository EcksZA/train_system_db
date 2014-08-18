require 'pg'

require './lib/lines'
require './lib/stations'
require './lib/stops'
require './lib/trains'

DB = PG.connect(:dbname => 'train_system_development')

puts "Welcome to the Train Operator UI"
puts "\n\n"

def operator_menu
  puts "Please select an option:"
  puts "\t" + "For add options, press 'a'"
  puts "\t" + "For list options, press 'l'"
  puts "\t" + "For edit options, press 'e'"
  puts "\t" + "For delete options, press 'd'"
  puts "\t" + "To exit, press 'q'"

  user_option = gets.chomp

  case user_option
  when 'a'
    add_option
  when 'l'
    list_option
  when 'e'
    edit_option
  when 'd'
    delete_option
  when 'q'
    puts "Thank you for using Train Operator UI"
    exit
  else
    "That is not a valid input. Please try again."
    operator_menu
  end
end

def add_option
  puts "Please select an option:"
  puts "\t" + "To add a train, press 't'"
  puts "\t" + "To add a line, press 'l'"
  puts "\t" + "To add a station, press 's'"
  puts "\t" + "To add a stop, press 'w'"
  puts "\t" + "To return to the Operator Menu, press 'r'"

  user_option = gets.chomp

  case user_option
  when 'l'
    add_line
  when 's'
    add_station
  when 't'
    add_train
  when 'w'
    add_stop
  when 'r'
    operator_menu
  else
    puts "That is not a valid option. Please try again"
    add_option
  end
end

def list_option
  puts "Please select an option:"
  puts "\t" + "To list all trains, press 't'"
  puts "\t" + "To list all lines, press 'l'"
  puts "\t" + "To list all stations, press 's'"
  puts "\t" + "To return to the Operator Menu, press 'r'"

  user_option = gets.chomp

  case user_option
  when 'l'
    Line.all.each {|list| puts list.name}
    puts "\n"
    list_option
  when 's'
    Station.all.each {|station| puts station.name}
    puts "\n"
    list_option
  when 't'
    Train.all.each {|list| puts list.name}
    puts "\n"
    list_option
  when 'r'
    operator_menu
  else
    puts "That is not a valid option. Please try again"
    add_option
  end
end

def delete_option
  puts "Please select an option:"
  puts "\t" + "To delete a train, press 't'"
  puts "\t" + "To delete a line, press 'l'"
  puts "\t" + "To delete a station, press 's'"
  puts "\t" + "To return to the Operator Menu, press 'r'"

  user_option = gets.chomp

  case user_option
  when 'l'
    Line.all.each {|list| puts list.name}
    puts "\n"
    puts "Enter the name of the line to be deleted"
    line_name = gets.chomp
    delete_line = Line.all[Line.all.find_index {|line| line.name == line_name}]
    delete_line.remove

    puts "The #{line_name} line has been deleted."
    delete_option
  when 's'
    Station.all.each {|list| puts list.name}
      puts "\n"
      puts "Enter the name of the station to be deleted"
      station_name = gets.chomp
      delete_station = Station.all[Station.all.find_index {|station| station.name == station_name}]
      delete_station.remove
      puts "The #{station_name} station has been deleted."
      delete_option
  when 't'
      Train.all.each {|list| puts list.name}
      puts "\n"
      puts "Enter the name of the train to be deleted"
      train_name = gets.chomp
      delete_train = Train.all[Train.all.find_index {|train| train.name == train_name}]
      delete_train.remove
      puts "The #{train_name} train has been changed to be #{edit_train.name} train."
      delete_option
  when 'r'
    operator_menu
  else
    puts "That is not a valid option. Please try again"
    add_option
  end
end

def edit_option
  puts "Please select an option:"
  puts "\t" + "To edit a train, press 't'"
  puts "\t" + "To edit a line, press 'l'"
  puts "\t" + "To edit a station, press 's'"
  puts "\t" + "To return to the Operator Menu, press 'r'"

  user_option = gets.chomp

  case user_option
  when 'l'
    Line.all.each {|list| puts list.name}
    puts "\n"
    puts "Enter the name of the line to be changed"
    line_name = gets.chomp
    puts "Enter the new name of the line"
    new_name = gets.chomp
    edit_line = Line.all[Line.all.find_index {|line| line.name == line_name}]
    edit_line.edit(new_name)
    edit_line = Line.all[Line.all.find_index {|line| line.name == new_name}]
    puts "\n"
    puts "The #{line_name} line has been changed to be #{edit_line.name} line."
    edit_option
  when 's'
    Station.all.each {|list| puts list.name}
      puts "\n"
      puts "Enter the name if the station to be changed"
      station_name = gets.chomp
      puts "Enter the new name of the station"
      new_name = gets.chomp
      edit_station = Station.all[Station.all.find_index {|station| station.name == station_name}]
      edit_station.edit(new_name)
      edit_station = Station.all[Station.all.find_index {|station| station.name == new_name}]
      puts "\n"
      puts "The #{station_name} station has been changed to be #{edit_station.name} station."
      edit_option
  when 't'
      Train.all.each {|list| puts list.name}
      puts "\n"
      puts "Enter the name if the train to be changed"
      train_name = gets.chomp
      puts "Enter the new name of the train"
      new_name = gets.chomp
      edit_train = Train.all[Train.all.find_index {|train| train.name == train_name}]
      edit_train.edit(new_name)
      edit_train = Train.all[Train.all.find_index {|train| train.name == new_name}]
      puts "\n"
      puts "The #{train_name} train has been changed to be #{edit_train.name} train."
      edit_option
  when 'r'
    operator_menu
  else
    puts "That is not a valid option. Please try again"
    add_option
  end
end

def add_stop
  puts "To create a stop please input the station and the line"
  puts "\n"
  puts "Please input the station fom the station list"
  Station.all.each {|station| puts station.name}
  user_station = gets.chomp
  stop_station = Station.all[Station.all.find_index {|station| station.name == user_station}]
  puts "You've selected the #{stop_station.name} station"
  puts "\n"
  puts "Please input the line you'd like to add to the station"
  Line.all.each {|list| puts list.name}
  user_line = gets.chomp
  stop_line = Line.all[Line.all.find_index {|line| line.name == user_line}]
  puts "You've selected the #{stop_line.name} line"
  new_stop = Stops.new({:station_id => stop_station.id, :line_id => stop_line.id})
  new_stop.save
  puts "\n"
  puts "The #{stop_line.name} line runs though #{stop_station.name} station"
  puts "The #{stop_station.name} station is on the #{stop_line.name}"
  exit_text = "stop"
  options_menu(exit_text)
end

def add_line
  puts "Add the name of the new line:"
  line_name = gets.chomp
  new_line = Line.new({:name => line_name})
  new_line.save
  puts "You have added the line: #{new_line.name} to the system."
  exit_text = "line"
  options_menu(exit_text)
end

def add_station
  puts "Add the name of the new station:"
  station_name = gets.chomp
  new_station = Station.new({:name => station_name})
  new_station.save
  puts "You have added the station: #{new_station.name} to the system."
  exit_text = "station"
  options_menu(exit_text)
end

def add_train
  Line.all.each {|list| puts list.name}
  puts "Enter the name of the line you would like to add the train to"
  user_line = gets.chomp
  new_train_line = Line.all[Line.all.find_index {|object| object.name == user_line}]
  new_train_line_id = new_train_line.id
  puts "Enter the name of the new train"
  user_train = gets.chomp
  new_train = Train.new({:name => user_train, :line_id => new_train_line_id})
  new_train.save
  puts "\n"
  puts "You have added the train: #{new_train.name} to the #{new_train_line.name} line"
  exit_text = "train"
  options_menu(exit_text)
end

def options_menu(entry_text)
  puts "Press 's' to add another #{entry_text} or 'q' to return to the operator menu."
  user_option = gets.chomp
  case user_option
  when 's'
    another_add(entry_text)
  when 'q'
    operator_menu
  else
    puts "That is not a vaid option. Please try again."
    options_menu(entry_text)
  end
end

def another_add(next_add)
  case next_add
  when 'station'
    add_station
  when 'line'
    add_line
  when 'stop'
    add_stop
  when 'train'
    add_train
  else
    puts "Something went wrong!"
  end
end

operator_menu
