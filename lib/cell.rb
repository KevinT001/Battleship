require 'ship'

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
    if @coordinate == empty?
    puts "."
    if @coordinate ==  
end
