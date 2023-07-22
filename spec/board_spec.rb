require "spec_helper"

RSpec.describe do
  describe "#initialize" do
    it "creates a board instance" do
      board = Board.new

      expect(board).to be_a(Board)
      expect(cboard.cells).to eq({})
    end
  end
end
