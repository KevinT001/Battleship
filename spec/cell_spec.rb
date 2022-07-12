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

end
