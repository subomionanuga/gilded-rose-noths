require_relative "item"

class AgedBrie < Item

  def initialize(sell_in, quality)
    super("Aged Brie", sell_in, quality)
  end

end
