
class Message

    def welcome 
        puts "Welcome to Battleship"
        puts "Enter any key to play. Enter q to quit."
    end

    def computer_board
       "========COMPUTER BOARD========"
    end

    def player_board 
        "========PLAYER BOARD========"
    end

    def cpu_ship_placment
        puts "I have laid out my ships on the grid."
    end

    def player_ship_placement
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."
    end

    def player_sub_placement
        puts "Enter the squares for the Submarine (2 spaces)."
    end

    def player_cruiser_placement 
        puts "Enter the squares for the Cruiser (3 spaces)."
    end

    def invalid_coordinates
        puts "Invalid coordinates. Please enter again."
    end

    def player_shoots
        puts "Enter the coordinate for your shot:"
    end

    def winner
        puts "Congratulations! You Won!"
    end



end