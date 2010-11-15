require File.dirname(__FILE__)+ '/../lib/use'

describe "use action stratey" do
  before(:each) do
    @use = Use.new
  end

  it "should match when the text begins with 'use'" do
    @use.matches?("use cheese").should == true
  end

  it "should not match when the text does not begin with 'use'" do
    @use.matches?("look cheese").should == false
  end
end

