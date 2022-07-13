require 'ship'
require 'pry'

class Cell
  attr_reader :coordinate,
              :ship

    def initialize(coordinate)
      @coordinate = coordinate
      @ship = nil

    end

    def empty?
      if @ship == nil
        return true
      else
        return false
      end
    end

    def place_ship(boat)
      @ship = boat
    end

    def fired_upon?
      if @ship.health == @ship.length
        return false
      else
        return true
      end
    end

    def fire_upon
      @ship.hit


    end

end
