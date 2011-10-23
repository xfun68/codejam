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
    transfor_to_digits(numbers)
    scale_each_digit
    join_digits
  end

  private

  def transfor_to_digits(numbers)
    @digits = numbers.chars.map do |number|
      DIGITS[number.to_i]
    end
  end

  def scale_each_digit
    @digits = @digits.map do |digit|
      digit = scale_digit_horizentaly(digit)
      scale_digit_vertically(digit)
    end
  end

  def scale_digit_horizentaly(digit)
    digit.map do |line|
      line.sub(/(.)(.)(.)/, '\1' + '\2' * @scale + '\3')
    end
  end

  def scale_digit_vertically(digit)
    [ digit[0],
     [digit[1]] * @scale,
      digit[2],
     [digit[3]] * @scale,
      digit[4] ].flatten
  end

  def join_digits
    (0...@digits.first.size).map do |index|
      @digits.map { |digit| digit[index] }.join
    end
  end
end

