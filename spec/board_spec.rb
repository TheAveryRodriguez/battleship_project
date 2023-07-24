require "spec_helper"

RSpec.describe do
  describe "#initialize" do
    it "creates a board instance" do
      board = Board.new
      expect(board).to be_a(Board)
    end
  end

  describe "#cells" do
    it "can hold cells on a board" do
      board = Board.new
      expect(board.cells).to be_a(Hash)

      expect(board.cells["A1"]).to be_a(Cell)
      expect(board.cells["A2"]).to be_a(Cell)
      expect(board.cells["A3"]).to be_a(Cell)
      expect(board.cells["A4"]).to be_a(Cell)
      expect(board.cells["B1"]).to be_a(Cell)
      expect(board.cells["B2"]).to be_a(Cell)
      expect(board.cells["B3"]).to be_a(Cell)
      expect(board.cells["B4"]).to be_a(Cell)
      expect(board.cells["C1"]).to be_a(Cell)
      expect(board.cells["C2"]).to be_a(Cell)
      expect(board.cells["C3"]).to be_a(Cell)
      expect(board.cells["C4"]).to be_a(Cell)
      expect(board.cells["D1"]).to be_a(Cell)
      expect(board.cells["D2"]).to be_a(Cell)
      expect(board.cells["D3"]).to be_a(Cell)
      expect(board.cells["D4"]).to be_a(Cell)
    end
  end

  describe "#valid_coordinate?" do
    it "only holds valid coordinates" do
      board = Board.new

      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe "#valid_placemnt?" do
    it "can place a ship in a coordinate if placement meets perameters" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end
  end
end
