require "spec_helper"

RSpec.describe do
  describe "#initialize" do
    it "creates a cell with attributes" do
      cell = Cell.new("B4")
      expect(cell).to be_a(Cell)

      expect(cell.coordinate).to eq("B4")
      expect(cell.ship).to eq(nil)
      expect(cell.empty?).to eq(true)

    end
  end

  describe "#place_ship" do
    it "places a ship in a cell" do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end
  end

  describe "#render" do 
    it 'renders a ship' do 
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)

      expect(cell_1.render).to eq(".")
      cell_1.fire_upon
      expect(cell_1.render).to eq("M")
    end
  end
end
