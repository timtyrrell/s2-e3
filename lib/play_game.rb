require File.dirname(__FILE__)+ '/../lib/game'
require './screen_util.rb'
require 'yaml'

rooms = YAML::load(File.open('./world.yml'))

game = Game.new(rooms)

result = ""
message = ""
until result == "quit"
  #output room and collect input
  ScreenUtil.clear
  STDOUT.flush
  unless message.empty?
    puts "*** #{message} ***"
  end
  unless game.previous_action.nil?
    puts "Previous action: #{game.previous_action}"
  end
  puts "[#{game.current_room["name"]}]"
  puts game.current_room["description"]
  puts "Obvious paths: #{ScreenUtil.output_directions(game)}"
  puts "Available Commands: 'go [place]', 'look at [thing]' 'pick up [thing]', 'drop [thing]', 'use [thing]'"
  game.previous_action = result = gets.chomp

  #parse input
  parsed_results = result.split(' ')
  if parsed_results.first == "go"
    # is the selected direction an option?
    if ScreenUtil.output_directions(game).include?(parsed_results.last)
      message = ""
      #of the available places
      game.current_room["places"].each do |place|
          place.each do |key, value|
            #get the value for the direction selected
            game.rooms.each do |room|
              #match the value to an id of a room and set it the current_room
              if room["id"] == value
                game.current_room = room
              end
            end
          end
        end
    else
       message = "#{parsed_results.last} is not supported direction"
    end
  end
end

