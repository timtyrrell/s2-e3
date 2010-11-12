#require File.dirname(__FILE__)+ '/../lib/game'

describe "use action stratey" do
  before(:each) do
    @use = Use.new
  end

  it "should match when the text begins with 'use'" do
    @use.match?("use cheese").should == true
  end

  it "should not match when the text does not begin with 'use'" do
    @use.match?("look cheese").should == false
  end
end

class Use
  def match?(text)
    parsed_text = text.split(' ')
    if parsed_text.first == "use"
      return true
    end
    false
  end
end

