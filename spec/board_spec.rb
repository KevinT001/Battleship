require './lib/ship'
require './lib/cell'
require './lib/board'

 RSpec.describe Board do 
    let(:board) {Board.new}
    let(:cruiser) {Ship.new("Cruiser, 3")}
    let(:submarine) {Ship.new("Submarine", 2)}
    
    it 'exists' do 
        expect(board).to be_a(Board)
    end

    it 'has cells on board' do 
        expect(board.cells).to be_a(Hash)
        expect(board.cells.size).to eq(16)
    end
        
    xit 'can tell us if coordinate is on board or not' do 
        expect(board.valid_coordinate?("A1")).to eq true
        expect(board.valid_coordinate?("D4")).to eq true
        expect(board.valid_coordinate?("A5")).to eq true
        expect(board.valid_coordinate?("AE")).to eq true
        expect(board.valid_coordinate?("A22")).to eq true
    end

    xit 'can check number of coordinates in array = same length of ship' do 
           
        expect(board.valid_placement?(cruiser,["A1", "A2"])).to eq false
        expect(board.valid_placement?(submarine,["A2", "A3", "A4"])).to eq false
    end 

    xit 'can check if coordinates are consecutive' do 
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq false
        expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq false
        expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq false
         expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq false
    end 
end

