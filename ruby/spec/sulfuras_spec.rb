require "sulfuras"

describe Sulfuras do

  it "checks that the quality of Sulfuras cannot be anything but 80" do
    item = [Sulfuras.new(0, 70)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect { item[0].quality }.to raise_error("Sulfuras can only be 80")
  end

  it "checks that Sulfuras quality cannot change" do
    item = [Sulfuras.new(0, 80)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(80)
  end
end
