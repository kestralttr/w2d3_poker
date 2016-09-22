require 'tdd'

describe "tdd" do
  let(:array) {[1,2,2,3,3,3]}
  let(:two_sum_array) {[-1, 1, 7, 0]}
  let(:my_transpose_array) {[[1,2,3],[4,5,6],[7,8,9]]}
  let(:stock_array) {[12,10,14,16,13]}
  # describe "my_uniq" do
  #   it "gets rid of duplicates" do
  #     expect(my_uniq(array)).to eq([1,2,3])
  #   end
  #
  #   it "doesn't call uniq method" do
  #     my_uniq(array)
  #     expect(my_uniq(array)).to_not receive(:uniq)
  #   end
  # end

  describe "two_sum" do
    it "returns pairs that sum to 0" do
      result = two_sum_array.two_sum
      expect(result).to eq([[0,1]])
    end

    it "checks that pairs are returned in sorted order" do
      result = two_sum_array.two_sum
      expect(result).to_not eq([[1,0]])
    end
  end

  describe "my_transpose" do
    it "correctly transposes a matrix" do
      result = my_transpose_array.my_transpose
      expect(result).to eq([[1,4,7],[2,5,8],[3,6,9]])
    end
  end

  describe "stock_picker" do
    it "correctly picks the highest_grossing days" do
      result = stock_array.stock_picker
      expect(result).to eq([1,3])
    end

    it "doesn't compare the index differences" do
      result = stock_array.stock_picker
      expect(result).to_not eq([0,4])
    end

  end



end
