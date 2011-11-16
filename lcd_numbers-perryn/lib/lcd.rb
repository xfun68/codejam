require 'digits'
require 'digit'
class LCD
  attr_writer :scale

  def initialize numbers, scale = 1
    @scale = scale
    @digits = Digits.new(numbers.chars.map { |char| Digit.new(char, scale) })
  end


  def display
    (1..(3 + 2*@scale)).inject([]) do |result, i|
      result << @digits.display_line(i)
    end
  end
  
end

