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
        
        it 'can check if placement of ship is valid' do 
            # Testing length of ship valid to number of coordinates
            expect(board.valid_placement?(cruiser,["A1", "A2"])).to eq false
            expect(board.valid_placement?(submarine,["A2", "A3", "A4"])).to eq false

            expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])). to eq false
            expect(board.valid_placement?(submarine, ["A1", "C1"]))
            expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])). to eq false
        end

        



    end
end
