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
    [ " - ", "| |", " - ", "  |", " - " ]
  ]

  attr_writer :scale

  def initialize
    @scale = 1
  end

  def display(numbers)
    join_each scaled_digits transformed_from(numbers)
  end

  private

  def transformed_from(numbers)
    numbers.chars.map { |char| DIGITS[char.to_i] }
  end

  def scaled_digits(digits)
    digits.map { |digit| scale_v scale_h(digit) }
  end

  def scale_h(digit)
    digit.map do |line|
      line[0] + line[1] * @scale + line[2]
    end
  end

  def scale_v(digit)
    [
      digit[0], [digit[1]] * @scale, digit[2], [digit[3]] * @scale, digit[4]
    ].flatten
  end

  def join_each(digits)
    (0...line_count).map { |index| digits.map { |digit| digit[index] }.join }
  end

  def line_count
    3 + 2 * @scale
  end
end

