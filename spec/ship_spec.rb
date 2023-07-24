require "spec_helper"

RSpec.describe do
  describe "#initialize" do
    it "creates a ship instance" do
      cruiser = Ship.new("Cruiser", 3)
      expect(cruiser).to be_a(Ship)
    end
  end

  describe "#attributes" do 
    it 'initializes with readable attributes' do 
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.name).to eq("Cruiser")
      expect(cruiser.length).to eq(3)
      expect(cruiser.health).to eq(3)
    end
  end

  describe "#hit" do
    it "removes 1 health from a ship" do
      cruiser = Ship.new("Cruiser", 3)

      cruiser.hit
      expect(cruiser.health).to eq(2)
      cruiser.hit
      expect(cruiser.health).to eq(1)
    end
  end

  describe "#sunk?" do
    it "shows if a ship has no more health" do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      expect(cruiser.health).to eq(2)
      cruiser.hit
      expect(cruiser.health).to eq(1)
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
    end
  end
end
