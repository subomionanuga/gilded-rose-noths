require "item"

class NormalItem < Item

def reduce_sell_in
  @sell_in -= 1
end

end
