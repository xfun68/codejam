class FizzBuzz

  def count(numbers)
    numbers.map do |number|
      fizz_buzz = ""
      if fizz_number?(number)
        fizz_buzz += "fizz"
      end
      if buzz_number?(number)
        fizz_buzz += "buzz"
      end
      fizz_buzz.empty? ? number : fizz_buzz
    end
  end

  private

  def fizz_number?(number)
    (number % 3) == 0
  end

  def buzz_number?(number)
    (number % 5) == 0
  end
end

