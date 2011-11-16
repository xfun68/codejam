class FizzBuzz

  def count(numbers)
    numbers.map do |number|
      fizz_buzz = ""
      if fizz_buzz?(number, 3)
        fizz_buzz += "fizz"
      end
      if fizz_buzz?(number, 5)
        fizz_buzz += "buzz"
      end
      fizz_buzz.empty? ? number : fizz_buzz
    end
  end

  private

  def fizz_buzz?(number, key_number)
    (number % key_number) == 0 or
    number.to_s.include?(key_number.to_s) or
    (number.to_s.chars.inject(0) { |total, char| total + char.to_i } % key_number == 0)
  end
end

