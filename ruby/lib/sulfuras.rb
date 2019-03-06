require_relative "item"

class Sulfuras < Item

  def initialize(sell_in, quality)
    super("Sulfuras, Hand of Ragnaros", sell_in, quality)
  end

  def reduce_sell_in
  end

end
