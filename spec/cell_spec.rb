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

end
