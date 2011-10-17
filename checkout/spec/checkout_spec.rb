require 'checkout'

describe Checkout do
  let(:co) { Checkout.new }

  describe "#total_price" do
    subject { co.total_price }

    before do
      goods.split(//).each { |item| co.scan(item) }
    end

    context "when given without goods" do
      let(:goods) { "" }
      it { should eql(0) }
    end
  end
end

