require 'ship'
require 'pry'

class Cell
  attr_reader :coordinate,
              :ship
  
  def initialize(coordinate)
    @coordinate = coordinate.to_s
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(boat)
      @ship = boat
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !empty?
      @ship.hit unless @fired_upon == true
    end
    @fired_upon = true
  end

  def render
    return "." unless fired_upon?
    return "M" if empty?
    if @ship.sunk?
    "X"
    else
    "H"
    end
  end 
end
