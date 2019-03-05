# require File.join(File.dirname(__FILE__), 'gilded_rose')
require "gilded_rose"

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

  describe "Normal Items" do

    item = [Item.new("My goodies", 10, 50)]
    it "checks that the item name is stored" do
      expect(item[0].name).to eq("My goodies")
    end
  end

end
