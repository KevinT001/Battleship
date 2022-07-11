require './lib/ship'

RSpec.describe Ship do

  cruiser = Ship.new("Cruiser", 3)

  it 'exists' do
    expect(ruiser.class).to be_a(Ship)
  end

  it 'has a name' do
    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    expect(cruiser.length).to eq(3)
  end  
end
