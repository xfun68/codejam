class Framer

  def decorate(*text)
    text = text.flatten
    result = []
    result << "+#{"-" * text.first.length}+"
    text.each do |line|
      result << "|#{line}|" unless line.empty?
    end
    result << "+#{"-" * text.first.length}+"
  end
end

