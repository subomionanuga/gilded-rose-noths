require "item"

describe Item do

  describe "Normal Items" do

    item = Item.new("My goodies", 10, 50)

    it "checks that new instances are initialised as expected" do
      expect(item.name).to eq("My goodies")
      expect(item.sell_in).to eq(10)
      expect(item.quality).to eq(50)
    end

    it "checks that strings are returned for item properties" do
      expect(item.to_s).to eq("My goodies, 10, 50")
    end
  end
end
