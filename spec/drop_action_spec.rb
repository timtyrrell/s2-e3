#require File.dirname(__FILE__)+ '/../lib/game'

describe "drop action stratey" do
  before(:each) do
    @drop = Drop.new
  end

  it "should match when the text begins with 'drop'" do
    @drop.match?("drop cheese").should == true
  end

  it "should not match when the text does not begin with 'drop'" do
    @drop.match?("look cheese").should == false
  end
end

class Drop
  def match?(text)
    parsed_text = text.split(' ')
    if parsed_text.first == "drop"
      return true
    end
    false
  end
end

