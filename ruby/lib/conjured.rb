require_relative "item"

class Conjured < Item

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
  end

  def quality_change
     @sell_in < 0 ? -4 : -2
  end

end
