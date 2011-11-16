class Digit
  
  DIGITS = [
    [ " - ", "| |", "   ", "| |", " - " ],
    [ "   ", "  |", "   ", "  |", "   " ],
    [ " - ", "  |", " - ", "|  ", " - " ],
  ]
  
  def initialize number, scale
    @lines = DIGITS[number.to_i].map do | unscaled_line|
      unscaled_line.sub(unscaled_line[1], unscaled_line[1]*scale)
    end
    
    first_extender = @lines[1]
    second_extender = @lines[3]
    (scale - 1).times do
      @lines.insert(1,first_extender)
      @lines.insert(-2,second_extender)
    end
  end
  
  def line line_number
     @lines[line_number - 1 ]
  end
  
  # def lines
  #   @lines
  # end
  
end