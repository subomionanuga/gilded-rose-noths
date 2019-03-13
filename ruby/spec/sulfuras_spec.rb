require "sulfuras"

describe Sulfuras do

  it "checks that Sulfuras quality cannot change" do
    item = Sulfuras.new(0, 80)
    item.update_item
    expect(item.quality).to eq(80)
  end

  it "checks that the quality of Sulfuras cannot be anything but 80" do
    item = Sulfuras.new(0, 70)
    expect { item.update_item }.to raise_error("Sulfuras can only be 80")
  end

  it "checks that the sell by date of Sulfuras cannot be anything but 0" do
    item = Sulfuras.new(5, 80)
    expect { item.update_item }.to raise_error("Sulfuras cannot be sold")
  end

end
