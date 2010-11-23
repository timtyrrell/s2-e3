$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'kitten_rescue'

describe "drop action stratey" do
  before(:each) do
    @drop = KittenRescue::Actions::Drop.new
  end

  it "should match when the text begins with 'drop'" do
    @drop.matches?("drop cheese").should == true
  end

  it "should not match when the text does not begin with 'drop'" do
    @drop.matches?("look cheese").should == false
  end
end

