require 'lcd_number'

describe LCD do

  describe "display single number" do
    subject { LCD.new.display(number) }

    context "given number is 0" do
      let(:number) { "0" }
      it { should eql([ " - ",
                        "| |",
                        "   ",
                        "| |",
                        " - " ]) }
    end

    context "given number is 6" do
      let(:number) { "6" }
      it { should eql([ " - ",
                        "|  ",
                        " - ",
                        "| |",
                        " - " ]) }
    end
  end

  describe "display multiple numbers" do
    subject { LCD.new.display(numbers) }

    context "given numbers is 007" do
      let(:numbers) { "007" }
      it { should eql([ " -  -  - ",
                        "| || |  |",
                        "         ",
                        "| || |  |",
                        " -  -    " ]) }
    end
  end

  describe "scale size" do
    subject { LCD.new.display(numbers, scale) }

    context "given numbers is 007" do
      let(:numbers) { "007" }
      let(:scale) { 2 }
      it { should eql([ " --  --  -- ",
                        "|  ||  |   |",
                        "|  ||  |   |",
                        "            ",
                        "|  ||  |   |",
                        "|  ||  |   |",
                        " --  --     " ]) }
    end
  end
end

