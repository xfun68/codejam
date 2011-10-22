require 'lcd'

describe LCDNumbers do

  describe "#display" do
    subject { LCDNumbers.new.display(numbers) }

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
end

