class Board
  attr_reader :cells
  def initialize
    @cells = {}
    create_cells
  end

  # def cells
  #   @cells = {}
  #   create_cells
  # end

  def create_cells
    ("A".."D").each do |letter|
      (1..4).each do |number|
        coordinate = "#{letter}#{number}"
        @cells[coordinate] = Cell.new(coordinate)

        # Potential solutions
        # Hash.values.flatten
        # cell_list = Hash.values.flatten
        # expect(cell_list).to all be_a(Cell)
      end
    end
  end
end
