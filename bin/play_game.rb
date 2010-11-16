require File.dirname(__FILE__)+ '/../lib/game'
require File.dirname(__FILE__)+ '/../lib/go'
require File.dirname(__FILE__)+ '/../lib/look'
require File.dirname(__FILE__)+ '/../lib/pick_up'
require File.dirname(__FILE__)+ '/../lib/use'
require File.dirname(__FILE__)+ '/../lib/drop'
require File.dirname(__FILE__)+ '/../lib/player'
require 'yaml'

yaml_file = File.dirname(__FILE__)+ '/../lib/world.yml'
rooms = YAML::load(File.open(yaml_file))

player = Player.new
game = Game.new(rooms, player)

game.register_action(Go.new)
game.register_action(Look.new)
game.register_action(PickUp.new)
game.register_action(Use.new)
game.register_action(Drop.new)

game.run

