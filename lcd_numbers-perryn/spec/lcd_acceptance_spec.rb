require 'lcd'

describe LCD do

  describe "#display" do
    subject { LCD.new(numbers).display }

    context "given a single number" do
      context "when the number is 0" do
        let(:numbers) { "0" }
        it { should eql([ " - ",
                          "| |",
                          "   ",
                          "| |",
                          " - " ]) }
      end
    end

    context "given multiple numbers" do
      let(:numbers) { "012" }
      it { should eql([ " -     - ",
                        "| |  |  |",
                        "       - ",
                        "| |  ||  ",
                        " -     - " ]) }
    end
  end

  describe "#scale" do
  
      context "the default value is 1" do
  
        let(:numbers) { "2" }
        subject { LCD.new(numbers).display }
        it { should eql([ " - ",
                          "  |",
                          " - ",
                          "|  ",
                          " - " ]) }
      end
  
      context "when set it to 2" do
        let(:numbers) { "012" }
        let(:scale) { 3 }
        subject {  LCD.new(numbers,scale).display }
        it { should eql([ " ---       --- ",
                          "|   |    |    |",
                          "|   |    |    |",
                          "|   |    |    |",
                          "           --- ",
                          "|   |    ||    ",
                          "|   |    ||    ",
                          "|   |    ||    ",
                          " ---       --- " ]) }
     end
  end
end

