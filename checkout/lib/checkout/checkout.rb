class Checkout
  attr_reader :total_price

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @goods = []
    @total_price = 0
  end

  def scan(item)
    @goods << item
    @goods.sort!
    calculate_price
  end

  private

  def calculate_price
    @total_price = 0
    @pricing_rules.inject(@goods.join) do |goods_list, pricing_rule|
      calculate_price_for_goods_that_match(pricing_rule, goods_list)
    end
  end

  def calculate_price_for_goods_that_match(pricing_rule, goods_list)
    goods, price = pricing_rule.keys.first.to_s, pricing_rule.values.first
    while goods_list.include?(goods) do
      goods_list.sub!(goods, "")
      @total_price += price
    end
    goods_list
  end
end

