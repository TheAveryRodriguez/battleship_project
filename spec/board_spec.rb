require "spec_helper"

RSpec.describe do
  describe "#initialize" do
    it "creates a board instance" do
      board = Board.new

      expect(board).to be_a(Board)
      expect(board.cells).to eq({})
    end
  end

  describe "#create_cells" do
    it "creates a hash of cells" do
      board = Board.new
      expect(board.cells).to eq({})
    end
  end
end
