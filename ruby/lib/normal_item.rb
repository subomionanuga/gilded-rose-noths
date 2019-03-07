require_relative "item"

class NormalItem < Item

def reduce_sell_in
  @sell_in -= 1
  new_quality = @quality + self.quality_change
  @quality = new_quality < 0 ? 0 : new_quality
end

  def quality_change
     @sell_in < 0 ? -2 : -1
  end
end
