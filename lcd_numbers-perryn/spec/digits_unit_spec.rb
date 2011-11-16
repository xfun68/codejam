require 'lcd'

describe Digits do
  
  context "created with several digits" do
    
    before do
      @one = double("digit one")
      @two = double("digit two")
      @digits = Digits.new([@one,@two])
    end
    
    it "should display lines joined from each digit" do
      @one.should_receive(:line).with(1).and_return("one")
      @two.should_receive(:line).with(1).and_return("two")
      @digits.display_line(1).should eql("onetwo")
    end
    
    
  end
  
end