class BowlingScoring
  def score(scores)
    scores.inject(0) do |total, score|
      total += (score[0] + score[1])
    end
  end
end

