require "normal_item"

describe "Normal Item" do

  item = Item.new("My goodies", 10, 50)

  it "checks that new instances are initialised as expected" do
    expect(item.name).to eq("My goodies")
    expect(item.sell_in).to eq(10)
    expect(item.quality).to eq(50)
  end

  it "checks that the sell by date updates as expected" do
    item = [Item.new("My goodies", 10, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].sell_in).to eq(9)
  end

  it "checks that items degarde twice as fast after sell by date" do
    item = [Item.new("My goodies", 0, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(8)
  end

  it "checks that quality is never negative" do
    item = [Item.new("My goodies", 10, 0)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(0)
  end

  it "checks that items can be update correctly multiple times" do
    item = [Item.new("My goodies", 1, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    shop.update_quality
    expect(item[0].quality).to eq(7)
  end
end
