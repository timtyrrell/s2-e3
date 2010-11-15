require File.dirname(__FILE__)+ '/../lib/look'

describe "look action strategy" do
  before(:each) do
    @look = Look.new
  end

  it "should match when the text begins with 'look at'" do
    @look.matches?("look at cheese").should == true
  end

  it "should not match when the text does not begin with 'look'" do
    @look.matches?("looks at cheese").should == false
  end

  it "should not match when the second word does not begin with 'at'" do
    @look.matches?("look cat cheese").should == false
  end
end

