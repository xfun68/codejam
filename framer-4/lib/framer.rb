class Framer

  def decorate(strings)
    @text = strings
    [header, text_with_side_border, footer].compact
  end

  private

  def header
    "+" + "-" * @text.length + "+"
  end

  def footer
    header
  end

  def text_with_side_border
    "|#{@text}|" unless @text.empty?
  end
end

