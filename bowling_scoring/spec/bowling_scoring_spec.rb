require 'bowling_scoring/bowling_scoring'

describe BowlingScoring do

  describe "#score" do
    subject { BowlingScoring.new.score(scores) }

    context "when all frames are missed" do
      let(:scores) {[[2, 0],
                     [1, 3],
                     [3, 6],
                     [0, 9],
                     [1, 8],
                     [9, 0],
                     [2, 7],
                     [3, 2],
                     [4, 5],
                     [8, 1, 0]]}
      it { should eql(74) }
    end
  end
end

