class Digits
  
  def initialize digits_array
    @digits_array = digits_array
  end
  
  # def add_digit digit
  #   @lines.
  # end
  
  def display_line(line_number)
    @digits_array.inject(""){ |line, digit| line += digit.line(line_number)  }
  end
  
end