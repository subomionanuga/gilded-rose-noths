require_relative "normal_item"

class BackstagePasses< NormalItem

  def initialize(sell_in, quality)
    super("Backstage passes to a TAFKAL80ETC concert", sell_in, quality)
  end

  # def reduce_sell_in
  #   @sell_in -= 1
  #   new_quality = @quality + self.quality_change
  #   @quality = new_quality < 0 ? 0 : new_quality
  # end

  # def quality_change
  #    case @sell_in
  #    when <= 0
  #      0
  #    when <= 5
  #      3
  #    when <= 10
  #      2
  #    else
  #      1
  #    end
  # end

end
