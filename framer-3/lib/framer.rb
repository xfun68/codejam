class Framer

  def decorate(*text)
    @text = text.flatten
    [header, text_with_side_border, footer].flatten
  end

  private

  def header
    footer
  end

  def footer
    "+" + "-" * width + "+"
  end

  def width
    @text.map { |line| line.length }.max || 0
  end

  def text_with_side_border
    @text.map do |line|
      "|#{line.ljust(width)}|" unless line.empty?
    end.compact
  end
end

