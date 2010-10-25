require File.dirname(__FILE__)+ '/../lib/room'

describe "Room" do
  before(:each) do
    @room = Room.new(2, "room name", nil, nil, nil)
  end
  it "test" do
    @room.name.should == "room name"
  end
 it "test" do
    @room.id.should == 2
  end

end

