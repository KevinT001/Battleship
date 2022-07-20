require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/message'
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
        @cpu_ships = 2
        @player_ships = 2
    end

    def run
        puts message.welcome
        user_input = gets.chomp.downcase
         if user_input == "q"
            exit
         end

        coordinates = random_coordinates(@cpu_cruiser, @cpu_board)
        coordinates2 = random_coordinates(@cpu_sub, @cpu_board)
        cpu_board.place_ship(@cpu_cruiser,coordinates)
        cpu_board.place_ship(@cpu_sub,coordinates2)

        # puts message.computer_board ( why does this not place sub ship?)
        puts cpu_board.render(false)
        puts message.player_board
        puts player_board.render(false)
        puts message.cpu_ship_placment
        puts message.player_ship_placement
        puts message.player_cruiser_placement


        is_valid_coordinates = false
         while is_valid_coordinates == false do
            user_coords = gets.chomp.upcase.split(" ")
            if player_board.valid_placement?(@player_cruiser,user_coords) == true
                player_board.place_ship(@player_cruiser, user_coords)
                puts message.computer_board
                puts cpu_board.render(false)
                puts message.player_board
                puts player_board.render(true)
                is_valid_coordinates == true
                break
            else puts message.invalid_coordinates
            end
        end

        puts message.computer_board
        puts cpu_board.render(false)
        puts message.player_board
        puts player_board.render(true)
        puts message.player_sub_placement

         is_valid_coordinates = false
         while is_valid_coordinates == false do
            user_coords = gets.chomp.upcase.split(" ")
            if player_board.valid_placement?(@player_sub,user_coords) == true
                player_board.place_ship(@player_sub, user_coords)

                puts message.computer_board
                puts cpu_board.render(false)
                puts message.player_board
                puts player_board.render(true)
                is_valid_coordinates == true
                break
            else puts message.invalid_coordinates
            end
        end


          #player turn to shoot
          #if a computer cruiser is not sunk?
          #if a computer sub is not sunk?
          #if our cruiser is not sunk?
          #if our sub is not sunk?

        until @cpu_ships == 0 || @player_ships == 0
        puts message.player_shoots
        player_shot = gets.chomp.upcase.strip
        if cpu_board.valid_coordinate?(player_shot)
        if cpu_board.cells["#{player_shot}"].fired_upon?
            player_shot
            puts "You cannot fire upon the same cell twice."


        else
            cpu_board.cells["#{player_shot}"].fire_upon
            if cpu_board.cells["#{player_shot}"].render == "X"
            puts "You sunk a #{@cpu_board.cells["#{player_shot}"].ship.name}!"
            cpu_ships -= 1
                if  cpu_ships == 0
                    puts message.winner
                    cpu_board = Board.new
                    player_board = Board.new
                    cpu_ships = player_ships = 2
                    run

                end
            elsif cpu_board.cells["#{player_shot}"].render == "H"
            puts "Your shot on #{player_shot} was a hit!"
            elsif cpu_board.cells["#{player_shot}"].render == "M"
            puts "Your shot on #{player_shot} was a miss."
            end
        end
        else
        puts message.invalid_coordinates
        player_shot
        end


        puts message.computer_board
        puts cpu_board.render(false)

        puts message.player_board
        puts player_board.render(true)

        computer_shot = player_board.cells.to_a.sample(1).flatten[0]
        duplicate_shot = player_board.cells["#{computer_shot}"].render != "."
        player_board.cells["#{computer_shot}"].fire_upon
        if player_board.cells["#{computer_shot}"].render == "X"
            puts "The computer sunk your #{@player_board.cells["#{computer_shot}"].ship.name}!"
            player_ships -= 1
                if player_ships == 0
                    puts message.loser
                    cpu_board = Board.new
                    player_board = Board.new
                    cpu_ships = player_ships = 2
                    run

                end
        elsif player_board.cells["#{computer_shot}"].render == "H"
            puts "The computer's shot on #{computer_shot} was a hit."
        elsif player_board.cells["#{computer_shot}"].render == "M"
            puts "The computer's shot on #{computer_shot} was a miss."
        end




        puts message.computer_board
        puts cpu_board.render(false)
        puts message.player_board
        puts player_board.render(true)
      end
    end








    def random_coordinates(boat, board)
        valid_coordinates = []
        until board.valid_placement?(boat, valid_coordinates) do
            coordinates = board.cells.keys
            start = rand(coordinates.size)
            length = boat.length
            valid_coordinates = coordinates.slice(start, length)

        end
        valid_coordinates
    end
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




# methods
