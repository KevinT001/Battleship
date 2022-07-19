require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_messages'
class Game
    attr_reader :player_board,
                :cpu_board,
                :player_ships, 
                :cpu_cruisers, 
                :cpu_sub, 
                :cpu_ships, 
                :message

    def initialize
        @player_board = Board.new 
        @cpu_board = Board.new 
        @player_sub = Ship.new("Submarine", 2)
        @player_cruiser = Ship.new("Cruiser", 3)
        @cpu_cruiser = Ship.new("Cruiser", 3)
        @cpu_sub = Ship.new("Submarine", 2)
        @message = Message.new
    end

    










    # create computer board
    #create player board
    # build game menu - welcome message, user input if they want to play or quit. (what if they quit, what happens?)
    # if play then computer must place ships
    #user prompted to place cruiser then place sub 
    #display message of ships have been placed. 
    #Player prompted to enter coordinates to shoot 
    #player shoots and renders board(CPU?)(check if game is over?/all ships sunk)
    # computer shoots. checks if game over? render player board
    #loop above steps until cpu OR  player ships = sunk
    #display message of winner. 
    #loop back to game menu 

    #message class? Need player info and cpu. 

    def 
        start
    end
end

# methods 