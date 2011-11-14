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
                     [8, 1]]}
      it { should eql(74) }
    end

    context "when there are spare frames" do
      let(:scores) {[[2, 0],
                     [7, 3],
                     [3, 6],
                     [0, 9],
                     [1, 8],
                     [9, 0],
                     [2, 7],
                     [3, 2],
                     [4, 5],
                     [8, 2],
                     [5, 0]]}
      it { should eql(94) }
    end

    context "when there are strike frames" do
      let(:scores) {[[2, 0],
                     [7, 3],
                     [3, 6],
                     [0, 9],
                     [1, 8],
                     [9, 0],
                     [2, 7],
                     [3, 2],
                     [4, 5],
                     [10, 0],
                     [10, 10]]}
      it { should eql(124) }
    end
  end
end

