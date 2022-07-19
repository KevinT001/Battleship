class Board
    attr_reader :cells

    def initialize
        @cells = {
            "A1"=> Cell.new("A1"),
            "A2"=> Cell.new("A2"),
            "A3"=> Cell.new("A3"),
            "A4"=> Cell.new("A4"),
            "B1"=> Cell.new("B1"),
            "B2"=> Cell.new("B2"),
            "B3"=> Cell.new("B3"),
            "B4"=> Cell.new("B4"),
            "C1"=> Cell.new("C1"),
            "C2"=> Cell.new("C2"),
            "C3"=> Cell.new("C3"),
            "C4"=> Cell.new("C4"),
            "D1"=> Cell.new("D1"),
            "D2"=> Cell.new("D2"),
            "D3"=> Cell.new("D3"),
            "D4"=> Cell.new("D4")
        }
    end

    def valid_coordinate?(coordinate)
        @cells.keys.any?(coordinate)
    end


    def valid_placement?(boat, user_coordinates)
        #condition 1
        #coordinate count must equal ship.length
        user_coordinates == ship.length 
        #condition 2
        #coordinate must exist and be empty.
          #for **each coordinate in the array of coordinates check if 
          #valid coordinate? and empty cell. 
        user_coordinates.each do |coordinate|
          if valid_coordinate?(coordinate) && @cells[coordinate].empty? && valid_horizontal_and_placement(user_coordinates)
             return true 
          else 
             false
          end
    end

    def valid_horizontal_and_placement(user_coordinates)
        letters = []
        numbers = [] 
        user_coordinates.each do |coordinate|
            letters<< coordinate[0]
            numbers << coordinate[1]
        end 
        

        if letters.uniq.count == 1 &&(numbers.min..numbers.max).to_a == numbers
            true
        elsif numbers.uniq.size == 1 &&(letters.min..letters.max).to_a == letters
            true 
        end

    end

    def place_ship(boat, array_of_coordinates)
        if valid_placement?(boat, array_of_coordinates)
            array_of_coordinates.each do |array_of_coordinate|
                @cells[array_of_coordinate].place_ship(boat)
            end
        else
            nil
        end
    end

    def render
        # 
    end

end 
