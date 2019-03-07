require "conjured"

describe Conjured do

  it "checks that items degrade by 2 daily" do
    item = [Conjured.new("Conjured goodies", 15, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(8)
  end
end
