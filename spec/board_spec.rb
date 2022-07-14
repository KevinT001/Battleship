require './lib/ship'
require './lib/cell'
require './lib/board'

    RSpec.describe Board do 
        let(:board) {Board.new}
        
        it 'exists' do 
            expect(board).to be_a(Board)
        end

        it 'has cells on board' do 
            expect(board.cells).to be_a(Hash)
            expect(board.cells.size).to eq(16)
        end
        



    end
end