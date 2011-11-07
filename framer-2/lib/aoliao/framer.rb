class Framer

  def decorate(box)
    @width, @height = box.width, box.height

                top_border                \
                    -                     \
    (left_border | box | right_border)    \
                    -                     \
                bottom_border
  end

  private

  def top_border
    Box.new("+" + "-" * @width + "+")
  end

  def bottom_border
    top_border
  end

  def left_border
    Box.new(["|"] * @height)
  end

  def right_border
    left_border
  end

end

