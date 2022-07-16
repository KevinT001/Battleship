
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
    if @fired_upon == false
      false 
    elsif @fired_upon == true 
      true 
    end
  end

  def fire_upon
    if empty? == true 
      @fired_upon = true
    elsif empty? == false  
     @fired_upon = true
      @ship.hit
    end
  end

  def render(visible = false)
    if !empty? && @fired_upon == true && @ship.health == 0
      "X"
    elsif visible == true && !empty?
      "S"
    elsif @fired_upon == true && !empty? 
      "H"
    elsif  @fired_upon == true && empty? 
      "M"
    elsif @fired_upon == false
      "."
    end
  end 
end
