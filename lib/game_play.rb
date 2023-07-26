class GamePlay

  def menu 
    puts "Welcome to BATTLESHIP!!

    Enter p to play. Enter q to quit."
    input = gets.chomp.downcase
    if input == "p"
      puts "Welcome aboard!"
      computer_ship_placement
    elsif input == "q"
      puts "Shove off, Sailor!"
      menu 
    else 
      puts "Invalid Input"
      menu
    end
  end 

  def game_info
    computer_board = Board.new 
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_sub = Ship.new("Submarine", 2)
    computer_sunk_ships = 0 

    player_board = Board.new 
    player_cruiser = Ship.new("Cruiser", 3)
    player_sub = Ship.new("Submarine", 2)
    player_sunk_ships = 0
  end

  def computer_ship_placement 
    # computer places sub and cruiser in: random coordinates && valid coordinates 
    # -------- code to be written ---------(.sample) = randomization 
    puts "I have placed my ships. Now it is your turn."
    player_ship_placement
  end

  def player_ship_placement
    # render computer board(false)
    #render user board(false)

    puts "Place your CRUISER on the board. Example: A1, A2, A3" 
    player_cruiser_placement = gets.chomp.upcase 
    # coordinates must be valid- must be 3 coordinates or invalid
    # if not valid "this is not a valid coordinate"
    # -------- code to be written ---------

    puts "Place your SUBMARINE on the board. Example: B1, C1"
    player_sub_placement = gets.chomp.upcase
    # coordinates must be valid- must be 2 coordinates or invalid 
    # if not valid "this is not a valid coordinate"
    # -------- code to be written ---------
    show_board
  end

  def show_board
    puts "=============COMPUTER BOARD============="
    puts     # render computer board(false)
    puts "==============PLAYER BOARD=============="
    puts     #render user board(true)
  end
end