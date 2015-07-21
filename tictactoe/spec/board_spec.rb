require_relative '../board'

module TicTacToe
  describe Board do
    context "when empty, default board" do
      subject(:board) { Board.new }

      it "is empty" do
        expect(board.data).to eq([[nil,nil,nil],
                                  [nil,nil,nil],
                                  [nil,nil,nil]])
      end
      it "is a 3x3" do
        expect(board.width).to eq(3)
        expect(board.height).to eq(3)
      end

      describe ".to_s" do
        it "returns a string representing the board" do
          expect(board.to_s).to eq("0 | 1 | 2\n---------\n3 | 4 | 5\n---------\n6 | 7 | 8")
        end
      end

      describe ".move" do
        before { board.move(0,0,'X') }
        it "adds the given token to the right location" do
          expect(board.data[0][0]).to eq('X')
        end
      end

      describe ".free?" do
        context "when there is no token" do
          it "is true" do
            expect(board.free?(0,0)).to eq(true)
          end
        end
        context "when there is a token" do
          before { board.move(0,0,'X') }
          it "is false" do
            expect(board.free?(0,0)).to eq(false)
          end
        end

      end
    end
    context "when 3x3 board" do
      subject(:board) { Board.new(3,3) }

      describe ".cell_coords" do
        it "has all coordinates" do
          expect(board.cell_coords).to eq([[0,0],[0,1],[0,2],
                                           [1,0],[1,1],[1,2],
                                           [2,0],[2,1],[2,2]])
        end
      end
    end
  end
end
