require_relative "normal_item"

class AgedBrie < NormalItem

  def initialize(sell_in, quality)
    super("Aged Brie", sell_in, quality)
  end

end
