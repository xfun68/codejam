require 'lcd_number'

describe LCDNumber do

  describe "#display" do
    subject { LCDNumber.new.display(numbers) }

    context "single number 0" do
      let(:numbers) { "0" }
      it { should eql([ " - ",
                        "| |",
                        "   ",
                        "| |",
                        " - " ]) }
    end

    context "single number 1" do
      let(:numbers) { "1" }
      it { should eql([ "   ",
                        "  |",
                        "   ",
                        "  |",
                        "   " ]) }
    end

    context "multiple numbers 007" do
      let(:numbers) { "007" }
      it { should eql([ " -  -  - ",
                        "| || |  |",
                        "         ",
                        "| || |  |",
                        " -  -    " ]) }
    end
  end

  describe "#scale" do
    lcd = LCDNumber.new
    subject { lcd.display(numbers) }

    context "when is 3" do
      let(:numbers) { "007" }
      lcd.scale = 3
      it { should eql([ " ---  ---  --- ",
                        "|   ||   |    |",
                        "|   ||   |    |",
                        "|   ||   |    |",
                        "               ",
                        "|   ||   |    |",
                        "|   ||   |    |",
                        "|   ||   |    |",
                        " ---  ---      " ]) }
    end
  end
end

