class Frame

  def initialize(scores)
    @scores = scores
  end

  def first_score
    @scores[0]
  end

  def second_score
    @scores[1]
  end

  def total_score
    @scores[0] + @scores[1]
  end

  def is_spare
    10 == (@scores[0] + @scores[1])
  end
end

class BowlingScoring

  def score(scores)
    spared = false
    scores.inject(0) do |total, score|
      frame = Frame.new(score)
      is_last_frame_spare = spared
      spared = frame.is_spare
      total += (frame.total_score + (is_last_frame_spare ? frame.first_score : 0))
    end
  end
end

