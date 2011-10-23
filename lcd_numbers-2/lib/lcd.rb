class LCD
  DIGITS = [
    [ " - ", "| |", "   ", "| |", " - " ],
    [ "   ", "  |", "   ", "  |", "   " ],
    [ " - ", "  |", " - ", "|  ", " - " ],
    [ " - ", "  |", " - ", "  |", " - " ],
    [ "   ", "| |", " - ", "  |", "   " ],
    [ " - ", "|  ", " - ", "  |", " - " ],
    [ " - ", "|  ", " - ", "| |", " - " ],
    [ " - ", "  |", "   ", "  |", "   " ],
    [ " - ", "| |", " - ", "| |", " - " ],
    [ " - ", "| |", " - ", "  |", " - " ],
  ]

  attr_writer :scale

  def initialize
    @scale = 1
  end

  def display(numbers)
    transform_to_digit(numbers)
    scale_each_digit
    join_each_digit
  end

  private

  def transform_to_digit(numbers)
    @digits = numbers.chars.map do |number|
      DIGITS[number.to_i]
    end
  end

  def scale_each_digit
    @digits = @digits.map do |digit|
      digit = scale_digit_horizentally(digit)
      scale_digit_vertically(digit)
    end
  end

  def scale_digit_horizentally(digit)
    digit.map do |line|
      strokes = line.split(//)
      [strokes[0], strokes[1] * @scale, strokes[2]].flatten.join
    end
  end

  def scale_digit_vertically(digit)
    [
      digit[0], [digit[1]] * @scale, digit[2], [digit[3]] * @scale, digit[4]
    ].flatten
  end

  def join_each_digit
    (0...@digits.first.size).map do |index|
      @digits.map do |digit|
        digit[index]
      end.join
    end
  end
end

