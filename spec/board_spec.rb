require "board"

describe Board do
  subject(:board) { Board.new(grid) }
  let(:grid) {[[3, 2, 1], [], []]}
  let(:winning_grid1) {[[],[],[3,2,1]]}
  let(:winning_board1) {Board.new(winning_grid1)}
  let(:winning_grid2) {[[],[3,2,1],[]]}
  let(:winning_board2) {Board.new(winning_grid2)}


  it "initializes to an array" do
    expect(board.grid.class).to be(Array)
  end

  describe "\#won?" do
    it "returns true if the center array is empty" do
      expect(winning_board1.won?).to be(true)
    end

    it "returns true if the right array is empty" do
      expect(winning_board2.won?).to be(true)
    end
  end

  describe "\#move" do
    it "moves a disc to an empty tower" do
      board.move(0,1)
      expect(board.grid).to eq([[3, 2], [1], []])
    end
  end 


end
