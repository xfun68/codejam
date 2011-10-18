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
    goods_list = @goods.join
    goods_list.cycle(@goods.count) do |list|
      @pricing_rules.each do |rule|
        if list.include?(rule.keys.first.to_s)
          list.sub!(rule.keys.first.to_s, "")
          @total_price += rule.values.first
          break
        end
      end
    end
  end
end

