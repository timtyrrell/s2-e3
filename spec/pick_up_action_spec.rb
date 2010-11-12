#require File.dirname(__FILE__)+ '/../lib/game'

describe "pick up strategy" do
  before(:each) do
    @pickup = PickUp.new
  end

  it "should match when the text begins with 'pick up'" do
    @pickup.match?("pick up cheese").should == true
  end

  it "should not match when the text does not begin with 'pick'" do
    @pickup.match?("look up cheese").should == false
  end

  it "should not match when the second word does not begin with 'up'" do
    @pickup.match?("pick at cheese").should == false
  end
end

class PickUp
  def match?(text)
    parsed_text = text.split(' ')
    if parsed_text.first == "pick" and parsed_text[1] == "up"
      return true
    end
    false
  end
end

