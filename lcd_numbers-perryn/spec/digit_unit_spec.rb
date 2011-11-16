require 'lcd'

describe Digit do
  
  it "should be able to write out all the numbers" do
      get_lines("0",1).should eql([" - ",
                                   "| |",
                                   "   ",
                                   "| |",
                                   " - "])
      
      get_lines("1",1).should eql(["   ",
                                   "  |",
                                   "   ",
                                   "  |",
                                   "   "])
       
       get_lines("2",1).should eql([" - ",
                                    "  |",
                                    " - ",
                                    "|  ",
                                    " - "])
    
  end
  
  it "should be able to scale a number" do
     get_lines("0",2).should eql([" -- ",
                                  "|  |",
                                  "|  |",
                                  "    ",
                                  "|  |",
                                  "|  |",
                                  " -- "])
    
  end
  
  
  def get_lines number, scale
     digit = Digit.new(number, scale)
     (1..(3 + 2*scale)).inject([]) do |result,line_number|
        result << digit.line(line_number)
     end
  end
  
  
end
