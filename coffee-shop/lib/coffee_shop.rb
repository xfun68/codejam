require 'order'

class CoffeeShop

  def order_foods(coffee, sauces = [])
    order = Order.new
    [coffee, sauces].flatten.each { |food| order.add_item(food, price_for(food)) }
    order
  end

  private

  def price_for(name)
    {
      "HomeBlend" => 0.89,
      "DarkRoast" => 0.99,
      "Decaf" => 1.05,

      "milk" => 0.1,
      "soy" => 0.15
    }.fetch(name, 0)
  end
end

