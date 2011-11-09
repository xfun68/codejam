require 'coffee_shop'

describe CoffeeShop do

  describe "#order" do
    subject { CoffeeShop.new.order(coffee, sauces) }

    context "when the coffee is HomeBlend" do
      let (:coffee) { "HomeBlend" }
      let (:sauces) { [] }
      its(:total_price) { should eql(0.89) }
    end

    context "when the coffee is HomeBlend and sauces are 2 milk and 1 soy" do
      let (:coffee) { "HomeBlend" }
      let (:sauces) { ["milk", "soy", "milk"] }
      its(:total_price) { should eql(1.24) }
    end
  end
end

