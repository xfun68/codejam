require 'pricing_rules'

class Checkout

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @goods = []
  end

  def total_price
    goods_list = @goods.join
    result = 0
    goods_list.cycle(@goods.count) do |list|
      @pricing_rules.each do |rule|
        if list.include?(rule.keys.first.to_s)
          list.sub!(rule.keys.first.to_s, "")
          result += rule.values.first
          break
        end
      end
    end
    result
  end

  def scan(item)
    @goods << item
    @goods.sort!
  end
end

