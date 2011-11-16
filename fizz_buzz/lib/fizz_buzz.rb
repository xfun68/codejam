class Cipher

  def initialize(target_number, password)
    @target_number = target_number
    @password = password
  end

  def encrypt(number)
    ((number % @target_number) == 0 or
     number.to_s.include?(@target_number.to_s) or
     (number.to_s.chars.inject(0) { |total, char| total + char.to_i } % @target_number == 0)) ? @password : ""
  end
end

class FizzBuzz

  def initialize
    @ciphers = [Cipher.new(3, "fizz"), Cipher.new(5, "buzz")]
  end

  def count(numbers)
    numbers.map do |number|
      fizz_buzz = ""
      @ciphers.each do |cipher|
        fizz_buzz += cipher.encrypt(number)
      end
      fizz_buzz.empty? ? number : fizz_buzz
    end
  end
end

