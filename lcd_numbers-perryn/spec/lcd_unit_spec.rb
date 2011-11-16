require 'lcd'

describe LCD do
  
    before do
      @digit = double("digit")
      Digit.stub(:new).and_return(@digit)
      @digits = double("digits")
      Digits.stub(:new).and_return(@digits)
    end

    it "should create instance of Digits" do     
      Digits.should_receive(:new).and_return(@digits)
      LCD.new("123")  
    end
    
    it "should create digits with a digit for each number using scale" do
        one = double("one")
        two = double("two")
        Digit.should_receive(:new).with("1",7).and_return(one)
        Digit.should_receive(:new).with("2",7).and_return(two)
        Digits.should_receive(:new).with([one,two]).and_return(@digits)
        LCD.new("12",7)
    end
    
    it "should default scale to 1" do
      one = double("one")
      Digit.should_receive(:new).with("1",1).and_return(one)
      LCD.new("1")
    end
    
    it "should display each line from digits" do 
      scale = 2
      (3+2*scale).times do |i|
        @digits.should_receive(:display_line).with(i+1).and_return("x")
      end
      LCD.new("12", scale).display.should eql(['x','x','x','x','x','x','x'])     
    end
    

end