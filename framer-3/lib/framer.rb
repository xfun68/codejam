class Framer

  def decorate(text)
    result = []
    result << "+#{"-" * text.length}+"
    result << "|#{text}|" unless text.empty?
    result << "+#{"-" * text.length}+"
  end
end

