class GildedRose

  BRIE = "Aged Brie"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  PASSES = "Backstage passes to a TAFKAL80ETC concert"

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # item.update_item
      if item.name != BRIE and item.name != PASSES
        if item.quality > 0 && item.name != SULFURAS
            item.quality -= 1
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == PASSES
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end

      item.reduce_sell_in

    end
  end
end
