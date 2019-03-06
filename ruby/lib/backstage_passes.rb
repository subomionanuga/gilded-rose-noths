require_relative "normal_item"

class BackstagePasses< NormalItem

  def initialize(sell_in, quality)
    super("Backstage passes to a TAFKAL80ETC concert", sell_in, quality)
  end

end
