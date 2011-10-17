require 'checkout'

describe Checkout do
  let(:co) { Checkout.new(PRICING_RULES) }

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

    context "given multiple combinations of favourable goods" do
      let(:goods) { "AAAAAA" }
      it { should eql(260) }
    end

    context "given a combination with a single goods" do
      let(:goods) { "AAAA" }
      it { should eql(180) }
    end

    context "given multiple combinations and different single goods in disorder" do
      let(:goods) { "DABABA" }
      it { should eql(190) }
    end
  end
end

