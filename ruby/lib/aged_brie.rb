require_relative "normal_item"

class AgedBrie < NormalItem

  def initialize(sell_in, quality)
    super("Aged Brie", sell_in, quality)
  end

  # def reduce_sell_in
  #   @sell_in -= 1
  #   new_quality = @quality + self.quality_change
  #   @quality = new_quality < 0 ? 0 : new_quality
  # end

  def quality_change
     @sell_in < 10 ? 2 : 1
  end
end
