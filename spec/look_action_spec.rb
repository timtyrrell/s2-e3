#require File.dirname(__FILE__)+ '/../lib/game'

describe "look action strategy" do
  before(:each) do
    @look = Look.new
  end

  it "should match when the text begins with 'look at'" do
    @look.match?("look at cheese").should == true
  end

  it "should not match when the text does not begin with 'look'" do
    @look.match?("looks at cheese").should == false
  end

  it "should not match when the second word does not begin with 'at'" do
    @look.match?("look cat cheese").should == false
  end
end

class Look
  def match?(text)
    parsed_text = text.split(' ')
    if parsed_text.first == "look" and parsed_text[1] == "at"
      return true
    end
    false
  end
end

