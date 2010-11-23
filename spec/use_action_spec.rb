$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'kitten_rescue'

describe "use action stratey" do
  before(:each) do
    @use = KittenRescue::Actions::Use.new
  end

  it "should match when the text begins with 'use'" do
    @use.matches?("use cheese").should == true
  end

  it "should not match when the text does not begin with 'use'" do
    @use.matches?("look cheese").should == false
  end
end

