require_relative '../lib/lcd'

describe LCD do

  describe "#display" do
    subject { LCD.new.display(numbers) }

    context "given a single number" do
      let(:numbers) { "0" }
      it { should eql([ " - ",
                        "| |",
                        "   ",
                        "| |",
                        " - "]) }
    end

    context "given multiple numbers" do
      let(:numbers) { "90" }
      it { should eql([ " -  - ",
                        "| || |",
                        " -    ",
                        "  || |",
                        " -  - "]) }
    end
  end

  describe "#scale" do
    let(:lcd) { LCD.new }
    subject {
      lcd.scale = scale
      lcd.display("90")
    }

    context "when set scale to more than 1" do
      let(:scale) { 3 }
      it { should eql([ " ---  --- ",
                        "|   ||   |",
                        "|   ||   |",
                        "|   ||   |",
                        " ---      ",
                        "    ||   |",
                        "    ||   |",
                        "    ||   |",
                        " ---  --- "]) }
    end
  end
end

