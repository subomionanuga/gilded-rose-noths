require_relative "normal_item"

class BackstagePasses< NormalItem

  def initialize(sell_in, quality)
    super("Backstage passes to a TAFKAL80ETC concert", sell_in, quality)
  end

  def reduce_sell_in
    new_quality = @quality + self.quality_change
    if new_quality < 0
      @quality = 0
    elsif new_quality > 50
      @quality = 50
    else
      @quality = new_quality
    end
    @sell_in -= 1
    concert_over?
  end

  def quality_change
    if @sell_in < 6
      3
    elsif @sell_in < 11
      2
    else
      1
    end
  end

  def concert_over?
    if @sell_in < 0
      @quality = 0
    end
  end

end
