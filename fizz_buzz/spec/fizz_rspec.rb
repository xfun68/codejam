require 'fizz_buzz'

describe FizzBuzz do

  describe "#count" do
    subject { FizzBuzz.new.count(numbers) }

    context "with numbers divided by fizz" do
      let(:numbers) { [1, 2, 3] }
      it { should eql([1, 2, "fizz"]) }
    end

    context "with numbers divided by buzz" do
      let(:numbers) { [10, 11] }
      it { should eql(["buzz", 11]) }
    end

    context "with numbers divided by fizz and buzz" do
      let(:numbers) { [15, 16] }
      it { should eql(["fizzbuzz", 16]) }
    end

    context "with numbers including fizz" do
      let(:numbers) { [11, 12, 13] }
      it { should eql([11, "fizz", "fizz"]) }
    end

    context "with numbers including buzz" do
      let(:numbers) { [58, 59] }
      it { should eql(["buzz", "buzz"]) }
    end

    context "with numbers sum divided by fizz" do
      let(:numbers) { [21, 22] }
      it { should eql(["fizz", 22]) }
    end

    context "with all conditions" do
      let(:numbers) { [555] }
      it { should eql(["fizzbuzz"]) }
    end
  end
end

