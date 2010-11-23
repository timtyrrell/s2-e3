$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'kitten_rescue'
require 'yaml'

yaml_file = File.dirname(__FILE__)+ '/../lib/kitten_rescue/config/world.yml'
rooms = YAML.load(File.open(yaml_file))

player = KittenRescue::Player.new
game = KittenRescue::Game.new(rooms, player)

game.register_action(KittenRescue::Actions::Go.new)
game.register_action(KittenRescue::Actions::Look.new)
game.register_action(KittenRescue::Actions::PickUp.new)
game.register_action(KittenRescue::Actions::Use.new)
game.register_action(KittenRescue::Actions::Drop.new)

game.run

