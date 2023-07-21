require './lib/ship'

cruiser = Ship.new("Cruiser", 3)

expect(cruiser.name
#=> "Cruiser"

expect(cruiser.length
#=> 3

expect(cruiser.health
#=> 3

expect(cruiser.sunk?
#=> false

cruiser.hit

expect(cruiser.health
#=> 2

expect(cruiser.hit

expect(cruiser.health
#=> 1

expect(cruiser.sunk?
#=> false

expect(cruiser.hit

expect(cruiser.sunk?
#=> true