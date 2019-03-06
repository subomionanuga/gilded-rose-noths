require "backstage_passes"

describe "Backstage passes" do

  it "checks that quality increases by 1 if concert more than 10 days away" do
    item = [BackstagePasses.new(15, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(11)
  end

  it "checks that quality increases by 2 if concert less than 10 days away" do
    item = [BackstagePasses.new(10, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(12)
  end

  it "checks that quality increases by 3 if concert less than 5 days away" do
    item = [BackstagePasses.new(5, 10)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(13)
  end

  it "checks that quality can not increase above 50" do
    item = [BackstagePasses.new(2, 50)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(50)
  end

  it "checks that quality drops to 0 after sell by date" do
    item = [BackstagePasses.new(0, 50)]
    shop = GildedRose.new(item)
    shop.update_quality
    expect(item[0].quality).to eq(0)
  end
end
