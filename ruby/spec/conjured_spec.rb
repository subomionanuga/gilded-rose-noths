require "conjured"

describe Conjured do

  it "checks that items degrade by 2 daily" do
    item = [Conjured.new("Conjured goodies", 15, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(8)
  end

  it "checks that items degrade by 4 after sell by date" do
    item = [Conjured.new("Conjured goodies", -1, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(6)
  end

  it "checks that quality is never negative" do
    item = [Conjured.new("Conjured goodies", 10, 0)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(0)
  end
end
