require "spec_helper"

RSpec.describe do
  describe "#initialize" do
    it "creates a board instance" do
      board = Board.new

      expect(board).to be_a(Board)
    end
  end

  describe "#create_cells" do
    it "creates a hash of cells" do
      board = Board.new
      board.create_cells

      expect(board.cells[“A1”].coordinate).to eq(“A1”)
    end
  end
end
