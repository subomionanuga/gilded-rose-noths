require_relative "item"

class Sulfuras < Item

  def initialize(sell_in, quality)
    super("Sulfuras, Hand of Ragnaros", sell_in, quality)
  end

  def update_item
    raise "Sulfuras can only be 80" if @quality != 80
    raise "Sulfuras cannot be sold" if @sell_in != 0
  end

end
