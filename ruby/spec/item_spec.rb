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

end
