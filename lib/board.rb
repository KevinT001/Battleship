require './lib/cell'
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
            "D4"=> Cell.new("D4"),
        }
    end

    def valid_coordinate?(coordinate)
        @cells.keys.any?(coordinate)
    end


    def valid_placement?(ship, coordinates)
        #condition 1
        #coordinate count must equal ship.length
        #condition 2
        #coordinate must exist and be empty.
          #for **each coordinate in the array of coordinates check if 
          #valid coordinate? and empty cell. 
      
        letters = coordinates.map { |letter| letter[0] }
        numbers = coordinates.map { |number| number[1] }
        not_vacant = coordinates.map { |piece| @cells[piece].empty? }
        if ship.length != coordinates.count
          false
        elsif not_vacant.include?(false) == true
          false
        elsif letters.uniq.count == 1 && (numbers.min..numbers.max).to_a == numbers
          true #above checks for horizontal
        elsif (letters.min..letters.max).to_a == letters && numbers.uniq.count == 1
          true #above checks for valid verticle
        elsif (letters.min..letters.max).to_a == letters && (numbers.min..numbers.max).to_a == numbers
          false #diagonal above 
        elsif letters.uniq.length == 1 && numbers.uniq.length == numbers
          false
        else
          false
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

    def render(visible_ship = false)

        if visible_ship == false
             puts "  1 2 3 4\nA #{cells["A1"].render} #{cells["A2"].render} #{cells["A3"].render} #{cells["A4"].render}\n" +
                "B #{cells["B1"].render} #{cells["B2"].render} #{cells["B3"].render} #{cells["B4"].render}\n" +
                "C #{cells["C1"].render} #{cells["C2"].render} #{cells["C3"].render} #{cells["C4"].render}\n" +
                "D #{cells["D1"].render} #{cells["D2"].render} #{cells["D3"].render} #{cells["D4"].render}"
        else
            puts "  1 2 3 4\nA #{cells["A1"].render(true)} #{cells["A2"].render(true)} #{cells["A3"].render(true)} #{cells["A4"].render(true)}\n" + 
                "B #{cells["B1"].render(true)} #{cells["B2"].render(true)} #{cells["B3"].render(true)} #{cells["B4"].render(true)}\n" +
                "C #{cells["C1"].render(true)} #{cells["C2"].render(true)} #{cells["C3"].render(true)} #{cells["C4"].render(true)}\n" +
                "D #{cells["D1"].render(true)} #{cells["D2"].render(true)} #{cells["D3"].render(true)} #{cells["D4"].render(true)}" 
        end 
    end
end
 



