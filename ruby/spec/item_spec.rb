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

    it "checks that quality can not increase above 50" do
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 50)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(50)
    end

    it "checks that quality drops to 0 after sell by date" do
      item = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(0)
    end
  end

  describe "Legendary Item" do

    it "checks that the quality of Sulfuras cannot be anything but 80" do
      item = [Item.new("Sulfuras, Hand of Ragnaros", 0, 70)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect { item[0].quality }.to raise_error("Sulfuras can only be 80")
    end

    it "checks that Sulfuras quality cannot change" do
      item = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      shop = GildedRose.new(item)
      shop.update_quality
      expect(item[0].quality).to eq(80)
    end
  end
end
