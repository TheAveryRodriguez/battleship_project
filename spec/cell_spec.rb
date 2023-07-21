require "spec_helper"

RSpec.describe do
  describe "#initialize" do
    it "creates a cell instance" do
      cell = Cell.new("B4")

      expect(cell).to be_a(Cell)
      expect(cell.coordinate).to eq("B4")
    end
  end

  describe "#place_ship" do
    it "places a ship in a cell" do
      cell = Cell.new("B4")

      expect(cell.ship).to eq(nil)
      expect(cell.empty?).to eq(true)

      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end
  end

  describe "#fire_upon" do
    it "fires upon a cell's ship and it is damaged" do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)
      expect(cell.fired_upon?).to eq(false)

      cell.fire_upon

      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end
  end
end
