require 'order'

class CoffeeShop
  PRICE_TABLE = {
    "HomeBlend" => 0.89,
    "DarkRoast" => 0.99,
    "Decaf" => 1.05,

    "milk" => 0.1,
    "soy" => 0.15
  }

  def order(coffee, sauces = [])
    order = Order.new
    order.add_item(coffee, PRICE_TABLE.fetch(coffee, 0))
    sauces.each do |sauce|
      order.add_item(sauce, PRICE_TABLE.fetch(sauce, 0))
    end
    order
  end
end

