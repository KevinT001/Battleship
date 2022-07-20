require './lib/ship'

RSpec.describe Ship do

  cruiser = Ship.new("Cruiser", 3)

  it 'exists' do
    expect(cruiser).to be_a(Ship)
  end

  it 'has a name' do
    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    expect(cruiser.length).to eq(3)
  end

  it 'has health' do
    expect(cruiser.health).to eq(3)
  end

  it 'can tell if sunk?' do
    expect(cruiser.sunk?).to eq(false)
  end

  it 'can be hit' do
    cruiser.hit
    expect(cruiser.health).to eq(2)
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
  end
end
