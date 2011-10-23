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
                        " - " ]) }
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
    let(:lcd) { LCD.new }
    subject {
      lcd.scale = scale
      lcd.display("1010")
    }

    context "when set scale to large than 1" do
      let(:scale) { 3 }
      it { should eql([ "      ---       --- ",
                        "    ||   |    ||   |",
                        "    ||   |    ||   |",
                        "    ||   |    ||   |",
                        "                    ",
                        "    ||   |    ||   |",
                        "    ||   |    ||   |",
                        "    ||   |    ||   |",
                        "      ---       --- " ]) }
    end
  end
end

