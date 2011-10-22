class LCDNumbers
  NUMBERS = [
    [ " - ", "| |", "   ", "| |", " - "],
    [ "   ", "  |", "   ", "  |", "   "],
    [ " - ", "  |", " - ", "|  ", " - "],
    [ " - ", "  |", " - ", "  |", " - "],
    [ "   ", "| |", " - ", "  |", "   "],
    [ " - ", "|  ", " - ", "  |", " - "],
    [ " - ", "|  ", " - ", "| |", " - "],
    [ " - ", "  |", "   ", "  |", "   "],
    [ " - ", "| |", " - ", "| |", " - "],
    [ " - ", "| |", " - ", "  |", " - "],
  ]

  attr_writer :scale

  def initialize
    @scale = 1
  end

  def display(numbers)
    transform_to_digits(numbers)
    scale_digits
    join_each_digit
  end

  private

  def transform_to_digits(numbers)
    @digits = numbers.chars.collect do |number|
      NUMBERS[number.to_i]
    end
  end

  def scale_digits
    @digits = @digits.collect do |digit|
      digit = scale_digit_horizentaly(digit)
      scale_digit_vertically(digit)
    end
  end

  def scale_digit_horizentaly(digit)
    digit.collect do |line|
      line.sub(/(.)(.)(.)/, '\1' + '\2'*@scale + '\3')
    end
  end

  def scale_digit_vertically(digit)
    [
      digit[0], [digit[1]] * @scale, digit[2], [digit[3]] * @scale, digit[4]
    ].flatten
  end

  def join_each_digit
    (0...line_count).collect do |line_number|
      @digits.collect do |digit|
        digit[line_number]
      end.join
    end
  end

  def line_count
    @digits.empty? ? 0 : @digits.first.size
  end
end

