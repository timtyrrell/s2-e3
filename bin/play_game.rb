require File.dirname(__FILE__)+ '/../lib/game'
require File.dirname(__FILE__)+ '/../lib/player'
require File.dirname(__FILE__)+ '/../lib/screen_util'
require File.dirname(__FILE__)+ '/../lib/look_action'
require File.dirname(__FILE__)+ '/../lib/go_action'
require File.dirname(__FILE__)+ '/../lib/pick_up_action'
require File.dirname(__FILE__)+ '/../lib/drop_action'
require File.dirname(__FILE__)+ '/../lib/use_action'
require 'yaml'

yaml_file = File.dirname(__FILE__)+ '/../lib/world.yml'

rooms = YAML::load(File.open(yaml_file))

player = Player.new
game = Game.new(rooms, player)

result = ""
message = ""
until result == "quit"
  #output room and collect input
  ScreenUtil.display_output(game, message)
  game.previous_action = result = gets.chomp

  #parse input and execute actions
  parsed_results = result.split(' ')
  message = ""
  if parsed_results.first == "go"
    message = GoAction.go(game, parsed_results[1])
  elsif parsed_results.first == "look" and parsed_results[1] == "at"
    message = LookAction.look(game, parsed_results[2])
  elsif parsed_results.first == "pick" and parsed_results[1] == "up"
    message =  PickUpAction.pick_up(game, parsed_results[2])
  elsif parsed_results.first == "drop"
    message =  DropAction.drop(game, parsed_results[1])
  elsif parsed_results.first == "use"
    message =  UseAction.use(game, parsed_results[1])
  else
    message = "*** #{result} is not a supported action ***"
  end
end

