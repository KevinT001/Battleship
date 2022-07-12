class Ship
<<<<<<< feat_Kyongnam_ship
  attr_reader :name, :length, :health, :hit
    def initialize(name, length)
      @name = name
      @length = length
      @health = length

    end

    def hit
      @health -= 1




=======
attr_reader :name,
            :length,
            :health
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  def sunk?
    @sunk = @health == 0
  end

  def hit
    @health -= 1
  end 
>>>>>>> main
end
