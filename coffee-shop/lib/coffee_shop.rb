class CoffeeShop

  def order(coffee)
    {
      "Homeblend" => 0.89,
      "DarkRoast" => 0.99,
      "Decaf" => 1.05
    }.fetch(coffee, 0.0)
  end
end

