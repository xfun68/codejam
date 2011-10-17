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
  end
end

