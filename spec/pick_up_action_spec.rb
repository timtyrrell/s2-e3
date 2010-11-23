$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'kitten_rescue'

describe "pick up strategy" do
  before(:each) do
    @pickup = KittenRescue::Actions::PickUp.new
  end

  it "should match when the text begins with 'pick up'" do
    @pickup.matches?("pick up cheese").should == true
  end

  it "should not match when the text does not begin with 'pick'" do
    @pickup.matches?("look up cheese").should == false
  end

  it "should not match when the second word does not begin with 'up'" do
    @pickup.matches?("pick at cheese").should == false
  end
end

