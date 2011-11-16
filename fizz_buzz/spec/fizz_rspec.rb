require 'fizz_buzz'

describe FizzBuzz do

  describe "#count" do
    subject { FizzBuzz.new.count(numbers) }

    context "with fizz only" do
      let(:numbers) { [1, 2, 3] }
      it { should eql([1, 2, "fizz"]) }
    end

    context "with buzz only" do
      let(:numbers) { [4, 5] }
      it { should eql([4, "buzz"]) }
    end

    context "with fizz-buzz" do
      let(:numbers) { [12, 13, 14, 15, 16] }
      it { should eql(["fizz", 13, 14, "fizzbuzz", 16]) }
    end
  end
end

