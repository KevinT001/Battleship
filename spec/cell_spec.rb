require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before :each do
    @cell = Cell.new("B4")
  end

  it 'exists' do
    expect(@cell).to be_a(Cell)
  end

  it 'has coordinates' do
    expect(@cell.coordinate).to eq("B4")
  end

  it 'has a cell with a ship?' do
    expect(@cell.ship).to eq(nil)
  end

  it 'can tell if cell is empty?' do
    expect(cell.empty?).to eq(true)
  end

  it 'can place ship on cell' do
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?). to eq(false)
  end

  it 'can see if cell is fired upon' do
    expect(cell.fired_upon?).to eq(false)
  end

  it 'can fire upon a cell' do
    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end 
end
