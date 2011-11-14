class Frame

  def initialize(scores = [0, 0])
    @scores = scores
  end

  def total_score(last_frame)
    total = @scores[0] + @scores[1]
    total += total if last_frame.is_strike?
    total += @scores[0] if last_frame.is_spare?
    total
  end

  def is_spare?
    (@scores[0] < 10) && (10 == (@scores[0] + @scores[1]))
  end

  def is_strike?
    10 == @scores[0]
  end
end

class BowlingScoring

  def score(scores)
    total = 0
    scores.inject(Frame.new) do |last_frame, score|
      current_frame = Frame.new(score)
      total += current_frame.total_score(last_frame)
      current_frame
    end
    total
  end
end

