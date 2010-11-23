$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'kitten_rescue'

describe "Game" do
  before(:each) do
    @room1 = KittenRescue::Room.new(1, "room1", nil, nil, nil)
    @room2 = KittenRescue::Room.new(2, "room2", nil, nil, nil)
    @room3 = KittenRescue::Room.new(3, "room3", nil, nil, nil)
    @room4 = KittenRescue::Room.new(4, "room4", nil, nil, nil)

    @rooms = [@room1, @room2, @room3, @room4]
    @game = KittenRescue::Game.new(@rooms, nil)
  end

  it "should have a collection of rooms" do
    @game.rooms.count.should_not == 0
  end

  it "should set the first room to the current room" do
    @game.current_room.id.should == 1
  end

end

