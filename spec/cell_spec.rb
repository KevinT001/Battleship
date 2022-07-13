require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

 let(:cell) {Cell.new("B4")}

  it 'exists' do
    expect(cell).to be_a Cell
  end

  it 'has coordinate' do
    expect(cell.coordinate).to eq("B4")
  end

  it 'does not contain ship' do
    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to be true
  end

  it 'can contain ship' do
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to be false
  end

  it 'knows when fired upon' do
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to be false

    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to be true
  end
  
  it 'can render a (.)/ (M)' do
    cell_1 = Cell.new("B4")
    expect(cell_1.render).to eq(".") #renders a "." when a blank unfired upon cell is present

    cell_1.fire_upon
    expect(cell_1.render).to eq("M") # renders a "M" when fired upon cell is counted as a miss.
  end

  it 'cant test another cell' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render).to eq(".")
  end

  it 'cell can render to show a ship placed' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    expect(cell_2.render(true)).to eq("S")
  end

  it 'cell can show H for hit when fired upon' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to eq(false)
  end

  it 'cells can show sunk ship with X' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)

    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
    expect(cell_2.render).to eq("X")
  end
end
