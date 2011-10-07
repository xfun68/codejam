class Framer

  def decorate(text)
    result = []
    result << "+" + "-" * text.size + "+"
    result << "|" + text + "|" if text.size > 0
    result << "+" + "-" * text.size + "+"
    result
  end
end
