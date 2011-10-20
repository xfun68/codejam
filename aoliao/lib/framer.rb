require 'lib/box'

class Framer

  def decorate(*strings)
    @text = Box.new(strings)
    @text.to_a.map { |row| decorate_row(row) }.unshift(header).push(footer)
  end

  private

  def decorate_row(string)
    "|" + string.ljust(@text.width) + "|"
  end

  def header
    footer
  end

  def footer
    "+" + "-" * @text.width + "+"
  end
end

