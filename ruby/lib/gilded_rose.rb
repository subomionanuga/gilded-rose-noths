class GildedRose

  BRIE = "Aged Brie"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  PASSES = "Backstage passes to a TAFKAL80ETC concert"

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update_item
    end
  end
end
