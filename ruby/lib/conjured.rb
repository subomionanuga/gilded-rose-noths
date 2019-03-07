require_relative "item"

class Conjured < Item

  def update_item
    new_quality = @quality + self.quality_change
    @quality = new_quality < 0 ? 0 : new_quality
    @sell_in -= 1
  end

  def quality_change
     @sell_in < 0 ? -4 : -2
  end

end
