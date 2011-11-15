class LCDNumber
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
    [ " - ", "| |", " - ", "  |", " - " ]
  ]

  attr_writer :scale

  def initialize
    @scale = 1
  end

  def display(numbers)
    @numbers = numbers
    transform_to_digits
    scale
    joined_digits
  end

  private

  def transform_to_digits
    @digits = @numbers.chars.map do |char|
      DIGITS[char.to_i]
    end
  end

  def scale
    scale_horizontally
    scale_vertically
  end

  def scale_horizontally
    @digits = @digits.map do |digit|
      digit.map do |line|
        line[0] + line[1] * @scale + line[2]
      end
    end
  end

  def scale_vertically
    @digits = @digits.map do |digit|
      [
         digit[0],
        [digit[1]] * @scale,
         digit[2],
        [digit[3]] * @scale,
         digit[4]
      ].flatten
    end
  end

  def joined_digits
    (0...@digits.first.size).map do |line_number|
      @digits.inject("") do |line, digit|
        line += digit[line_number]
      end
    end
  end
end

