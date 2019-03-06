require "item"

class NormalItem < Item

  def update_item
    if @name != "Aged Brie" || "Backstage passes to a TAFKAL80ETC concert"
      if @quality > 0
        reduce_quality
      end
    end
  end

  # def reduce_quality
  #   @quality -= 1
  # end
end
