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

  def quality_change
    if @sell_in < 0
      @quality = 0
    elsif @sell_in < 6
      3
    elsif @sell_in <11
      2
    else
      1
    end
    # concert_over?
  end

  # def concert_over?
  #   if @sell_in < 0
  #     @quality = 0
  #   end
  # end

end
