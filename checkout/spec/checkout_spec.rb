require 'checkout'

describe Checkout do
  let(:co) { Checkout.new }

  describe "#total_price" do
    subject { co.total_price }

    before do
      goods.split(//).each { |item| co.scan(item) }
    end

    context "given without any goods" do
      let(:goods) { "" }
      it { should eql(0) }
    end

    context "given single goods" do
      let(:goods) { "A" }
      it { should eql(50) }
    end

    context "given multiple different goods" do
      let(:goods) { "AB" }
      it { should eql(80) }
    end

    context "given a combination of favourable goods" do
      let(:goods) { "AAA" }
      it { should eql(130) }
    end
  end
end

