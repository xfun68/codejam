class Checkout
  PRICING_RULES = {
    :A => 50,
    :B => 30,
    :C => 20,
    :D => 15,
    :E => 17
  }

  def initialize
    @goods = []
  end

  def total_price
    @goods.inject(0) do |result, item|
      result += PRICING_RULES.fetch(item.to_sym, 0)
    end
  end

  def scan(item)
    @goods << item
  end
end

