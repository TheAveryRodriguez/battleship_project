class Ship
  attr_reader :name, :length, :health
  def initialize(name, length)
    @name = name
    @length = length
  end
end

def health
  health = @length
end

def hit
  health - 1
end

def sunk?
  !(health > 0)
end
