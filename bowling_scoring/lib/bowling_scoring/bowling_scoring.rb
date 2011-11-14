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

  def is_strike
    10 == @scores[0]
  end
end

class BowlingScoring

  def score(scores)
    last_frame = Frame.new([0, 0])
    scores.inject(0) do |total, score|
      frame = Frame.new(score)
      total += frame.total_score
      if last_frame.is_strike
        total += frame.total_score
      elsif last_frame.is_spare
        total += frame.first_score
      end
      last_frame = frame
      total
    end
  end
end

