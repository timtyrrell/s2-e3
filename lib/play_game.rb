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
    puts "#{message}"
  end
  unless game.previous_action.nil?
    puts "Previous action: #{game.previous_action}"
  end
  puts "[#{game.current_room["name"]}]"
  puts game.current_room["description"]
  unless game.current_room["items"].nil?
    puts "Obvious items: #{ScreenUtil.output_items(game)}"
  end
  puts "Obvious paths: #{ScreenUtil.output_directions(game)}"
  puts "Available Commands: 'go [place]', 'look at [thing]' 'pick up [thing]', 'drop [thing]', 'use [thing]', 'quit'"
  game.previous_action = result = gets.chomp

  #parse input and execute action
  parsed_results = result.split(' ')
  message = ""
  if parsed_results.first == "go"
    if ScreenUtil.is_a_possible_direction?(game, parsed_results[1])
      game.current_room = ScreenUtil.match_direction_to_room(game, parsed_results[1])
    else
      message = "*** #{parsed_results[1]} is not a supported direction ***"
    end
  elsif parsed_results.first == "look" and parsed_results[1] == "at"
    if ScreenUtil.is_a_lookable_item?(game, parsed_results[2])
      message =  ScreenUtil.match_item_to_room(game, parsed_results[2])
    else
      message = "*** #{parsed_results[2]} is not a supported lookable item ***"
    end
  elsif parsed_results.first == "pick" and parsed_results[1] == "up"
    message =  "pick up #{parsed_results.last}"
  elsif parsed_results.first == "drop"
    message =  "drop #{parsed_results.last}"
  elsif parsed_results.first == "use"
    message =  "use #{parsed_results.last}"
  else
    message = "*** #{result} is not a supported action ***"
  end
end

