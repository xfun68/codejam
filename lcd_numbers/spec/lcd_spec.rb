require 'lcd'

describe LCDNumbers do

  describe "#display" do
    lcd = LCDNumbers.new
    subject { lcd.display(numbers) }

    context "given only one single number" do
      let(:numbers) { "0" }
      it { should eql([ " - ",
                        "| |",
                        "   ",
                        "| |",
                        " - " ]) }
    end

    context "given multiple numbers" do
      let(:numbers) { "03" }
      it { should eql([ " -  - ",
                        "| |  |",
                        "    - ",
                        "| |  |",
                        " -  - " ]) }
    end
  end

  describe "#scale" do
    lcd = LCDNumbers.new
    subject { lcd.display("03") }

    times = 2
    context "when scale #{times} times" do
      lcd.scale = times
      it { should eql([ " --  -- ",
                        "|  |   |",
                        "|  |   |",
                        "     -- ",
                        "|  |   |",
                        "|  |   |",
                        " --  -- " ]) }
    end
  end
end

