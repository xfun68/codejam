require 'coffee_shop'

describe CoffeeShop do

  describe "#order" do
    subject { CoffeeShop.new.order(coffee) }

    context "when the coffee is HomeBlend" do
      let (:coffee) { "Homeblend" }
      it { should eql(0.89) }
    end
  end
end

