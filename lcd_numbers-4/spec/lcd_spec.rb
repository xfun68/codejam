require 'lcd'

describe LCD do

  describe "#display" do
    subject { LCD.new.display(numbers) }

    context "given a single number" do
      context "when the number is 0" do
        let(:numbers) { "0" }
        it { should eql([ " - ",
                          "| |",
                          "   ",
                          "| |",
                          " - " ]) }
      end

      context "when the number is 9" do
        let(:numbers) { "9" }
        it { should eql([ " - ",
                          "| |",
                          " - ",
                          "  |",
                          " - " ]) }
      end
    end

    context "given multiple numbers" do
      let(:numbers) { "007" }
      it { should eql([ " -  -  - ",
                        "| || |  |",
                        "         ",
                        "| || |  |",
                        " -  -    " ]) }
    end
  end

  describe "#scale" do

    context "the default value is 1" do
      lcd = LCD.new
      let(:numbers) { "3" }
      subject { lcd.display(numbers) }
      it { should eql([ " - ",
                        "  |",
                        " - ",
                        "  |",
                        " - " ]) }
    end

    context "when set it to 2" do
      lcd = LCD.new
      lcd.scale = 2
      let(:numbers) { "3" }
      subject { lcd.display(numbers) }
      it { should eql([ " -- ",
                        "   |",
                        "   |",
                        " -- ",
                        "   |",
                        "   |",
                        " -- " ]) }
    end
  end
end

