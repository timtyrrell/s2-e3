require File.dirname(__FILE__)+ '/../lib/go'

describe "Go action stratey" do
  before(:each) do
    @go = Go.new
  end

  it "should match when the text begins with 'go'" do
    @go.matches?("go west").should == true
  end

  it "should not match when the text does not begin with 'go'" do
    @go.matches?("looks go west").should == false
  end
end

