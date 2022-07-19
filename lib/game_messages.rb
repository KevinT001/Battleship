require './lib/'
class Message

    def welcome 
        puts "Welcome to Battleship"
        puts "Enter p to play. Enter q to quit."
    end

    def computer_board
       10.times {puts "="} + "COMPUTER BOARD" + 10.times {puts "="}
    end

    def player_board 
        10.times {puts "="} + "PLAYER BOARD" + 10.times {puts "="}
    end

    def cpu_ship_placment
        puts "I have laid out my ships on the grid."
    end

    def player_ship_placement
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two unites long."
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

    def player_shot
        if #cpu ship is hit
            puts "Hit"
        else
            puts "Your shot missed"
        end
    end

    def computer_shot
        if #cpu hits player ship
            puts "Computer shot hit"
        else
            puts "Computer missed"
        end
    end

    def winner
        if #player wins
            puts "You won!"
        else #computer wins (all player ships sunk)
            "You lose!"
        end
    end



end