class Array
  # def my_uniq(arr)
  #   result = []
  #   arr.each do |el|
  #     unless result.include?(el)
  #       result << el
  #     end
  #   end
  #   result
  # end

  def two_sum
    result = []
    (0..self.length-2).each do |i|
      (i+1..self.length-1).each do |j|
        if self[i] + self[j] == 0
          result << [i, j]
        end
      end
    end
    result
  end

  def my_transpose
    result = []
    self.length.times do
      sub_arr = []
      self.each do |row|
        sub_arr << row.shift
      end
      result << sub_arr
    end
    result
  end

  #[12,10,14,16,13]
  def stock_picker
    result = []
    (0..self.length-2).each do |i|
      (i+1..self.length-1).each do |j|
        result << [i, j]
      end
    end
    final_result = []
    final_result_sum = 0
    result.each do |arr|
      if (self[arr.last] - self[arr.first]) > final_result_sum
        final_result = arr
        final_result_sum = self[final_result.last] - self[final_result.first]
      end
    end
    final_result
  end

end
