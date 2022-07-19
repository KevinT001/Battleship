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


end