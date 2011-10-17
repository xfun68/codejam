class Checkout
  PRICING_RULES = [
    {:AAA => 130},
    {:A => 50},

    {:BB => 45},

    {:B => 30},

    {:C => 20},

    {:D => 15},

    {:EEE => 34},
    {:E => 17},
  ]

  def initialize
    @goods = []
  end

  def total_price
    goods_list = @goods.join
    result = 0
    goods_list.cycle(@goods.count) do |list|
      PRICING_RULES.each do |rule|
        if list.include?(rule.keys.first.to_s)
          list.delete!(rule.keys.first.to_s)
          result += rule.values.first
        end
      end
    end
    result
  end

  def scan(item)
    @goods << item
  end
end

