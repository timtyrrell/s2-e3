#require File.dirname(__FILE__)+ '/../lib/game'

describe "Go action stratey" do
  before(:each) do
    @go = Go.new
  end

  it "should match when the text begins with 'go'" do
    @go.match?("go west").should == true
  end

  it "should not match when the text does not begin with 'go'" do
    @go.match?("looks go west").should == false
  end
end

class Go
  def match?(text)
    parsed_text = text.split(' ')
    if parsed_text.first == "go"
      return true
    end
    false
  end
end

