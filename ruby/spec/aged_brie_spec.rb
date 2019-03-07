require "aged_brie"

describe "Aged Brie" do

  it "checks that quality increases over time" do
    item = [AgedBrie.new(11, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(11)
  end

  it "checks that quality increases by 2 after sell by date" do
    item = [AgedBrie.new(0, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(12)
  end

  it "checks that quality can not increase above 50" do
    item = [AgedBrie.new(0, 49)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(50)
  end
end
