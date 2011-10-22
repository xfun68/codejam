require 'lcd'

describe LCDNumbers do

  describe "#display" do
    subject { LCDNumbers.new.display(numbers) }

    context "when the numbers is empty" do
      let(:numbers) { "" }
      it { should eql("") }
    end
  end
end

