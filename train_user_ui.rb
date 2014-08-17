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

main_menu
