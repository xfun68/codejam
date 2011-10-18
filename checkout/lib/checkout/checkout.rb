class Checkout
  attr_reader :total_price

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @goods = []
    @total_price = 0
  end

  def scan(item)
    append_new item
    calculate_price
  end

  private

  def append_new(item)
    @goods << item.upcase
    @goods_list = @goods.join.split(//).sort.join
  end

  def calculate_price
    @total_price = 0
    @pricing_rules.each do |pricing_rule|
      calculate_price_for_goods_that_match(pricing_rule)
    end
  end

  def calculate_price_for_goods_that_match(pricing_rule)
    goods, price = pricing_rule.keys.first.to_s, pricing_rule.values.first
    while @goods_list.include?(goods) do
      @goods_list.sub!(goods, "")
      @total_price += price
    end
  end
end

