# require "gilded_rose"
require "item"

describe Item do

  item = [Item.new("My goodies", 10, 50)]

  it "checks that new instances are initialised as expected" do
    expect(item[0].name).to eq("My goodies")
    expect(item[0].sell_in).to eq(10)
    expect(item[0].quality).to eq(50)
  end

  it "checks that strings are returned for item properties" do
    expect(item[0].to_s).to eq("My goodies, 10, 50")
  end

  describe "Update Normal Items" do

    it "checks that the sell by date updates as expected" do
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

  describe "Aged Brie" do

    it "checks that quality increases over time" do
      item = [Item.new("Aged Brie", 10, 10)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(11)
    end

    it "checks that quality increases by 2 after sell by date" do
      item = [Item.new("Aged Brie", 0, 10)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(12)
    end

    it "checks that quality can not increase above 50" do
      item = [Item.new("Aged Brie", 0, 49)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(50)
    end
  end

  describe "Backstage passes" do

    it "checks that quality increases by 1 if concert more than 10 days away" do
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 10)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(11)
    end

    it "checks that quality increases by 2 if concert less than 10 days away" do
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(12)
    end

    it "checks that quality increases by 3 if concert less than 5 days away" do
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(13)
    end

    it "checks that quality drops to 0 after sell by date" do
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(0)
    end
  end
end
