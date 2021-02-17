require_relative '../index'

RSpec.describe Enumerable do
  describe '#my_select' do
    it 'Returns just the even numers of the array' do
      expect([1, 2, 3, 4, 5].my_select(&:even?)).to eql([2, 4])
    end
  end
  describe '#my_all?' do
    it 'Returns true as all the words are greater than or equal to 3' do
      expect(%w[ant bear car].my_all? { |word| word.length >= 3 }).to eql(true)
    end
    it 'Returns false as all the words are not greater than or equal to 4' do
      expect(%w[ant bear car].my_all? { |word| word.length >= 4 }).to eql(false)
    end
    it 'Returns false if one input does not have a t in it' do
      expect(%w[ant bear car].my_all?(/t/)).to eql(false)
    end
    it 'Returns true if all inputs are numeric' do
      expect([1, 2i, 3, 14].my_all?(Numeric)).to eql(true)
    end
    it 'Returns true if all inputs have a value of true' do
      expect([nil, true, 99].my_all?).to eql(false)
    end
    it 'Returns true if array is empty' do
      expect([].my_all?).to eql(true)
    end
  end
  describe '#my_any?' do
    it 'Returns true if any of the words are 3 characters or longer' do
      expect(%w[ant bear car].my_any? { |word| word.length >= 3 }).to eql(true)
    end
    it 'Returns true if any of the words are 4 character or longer' do
      expect(%w[ant bear car].my_any? { |word| word.length >= 4 }).to eql(true)
    end
    it 'Returns false if no one of the inputs has a d in it' do
      expect(%w[ant bear car].my_any?(/d/)).to eql(false)
    end
    it 'Returns true if any inputs are Integers' do
      expect([nil, true, 99].my_any?(Integer)).to eql(true)
    end
    it 'Returns true if any inputs have a value of true' do
      expect([nil, true, 99].my_any?).to eql(true)
    end
    it 'Returns false if array is empty' do
      expect([].my_any?).to eql(false)
    end
  end
  describe '#my_none?' do
    it 'Returns true if none of the words have length of 5' do
      expect(%w[ant bear car].my_none? { |word| word.length == 5 }).to eql(true)
    end
    it 'Returns false if none of the words have a lenght greater than or equal to 4' do
      expect(%w[ant bear car].my_none? { |word| word.length >= 4 }).to eql(false)
    end
  end

  describe '#my_each' do
    it 'Returns every value according to the yield' do
      expect([1, 2, 3, 4].my_each { |x| x + 1 }).to eql([1, 2, 3, 4])
    end
    it 'Returns true if none of the words have a d in them' do
      expect(%w[ant bear car].my_none?(/d/)).to eql(true)
    end
    it 'Returns false if some of the array elements are Floats' do
      expect([1, 3.14, 42].my_none?(Float)).to eql(false)
    end
    it 'Returns true if array is empty' do
      expect([].my_none?).to eql(true)
    end
    it 'Returns true if array is contains only nils' do
      expect([nil].my_none?).to eql(true)
    end
    it 'Returns true if array is contains only nils and false' do
      expect([nil, false].my_none?).to eql(true)
    end
    it 'Returns true if array is contains only nils and false' do
      expect([nil, false, true].my_none?).to eql(false)
    end
  end
  describe '#my_inject' do
    it 'Sums up the inputted Range of numbers' do
      expect((5..10).my_inject(:+)).to eql(45)
    end
    it 'Sums up the inputted Range of numbers using the block' do
      expect((5..10).my_inject { |sum, n| sum + n }).to eql(45)
    end
    it 'Multiply the inputted Range of numbers, and use 1 as begginning value, using symbol' do
      expect((5..10).my_inject(1, :*)).to eql(151_200)
    end
    it 'Multiply the inputted Range of numbers, and use 1 as begginning value, using block' do
      expect((5..10).my_inject(1) { |product, n| product * n }).to eql(151_200)
    end
  end

  describe '#my_each_with_index' do
    it '' do
      expect([1, 2, 3, 4].my_each_with_index do |val, index|
               "index: #{index} for #{val}"
             end).to eql([1, 2, 3, 4].each_with_index do |val, index|
                           "index: #{index} for #{val}"
                         end)
    end
  end

  describe '#my_count' do
    it 'Returns the amount of values in the array' do
      expect([1, 2, 3, 4].my_count).to eql([1, 2, 3, 4].count)
    end

    it 'Returns the amount of values that match the argument' do
      expect([1, 2, 3, 2].count(2)).to eql([1, 2, 3, 2].count(2))
    end

    it 'Returns the amount of values that match the yield' do
      expect([1, 2, 3, 2].my_count(&:even?)).to eql([1, 2, 3, 2].count(&:even?))
    end
  end

  describe '#my_map' do
    it 'Returns the array adding the value of the yield' do
      expect([1, 2, 3, 4].my_map { |i| i * i }).to eql([1, 2, 3, 4].map { |i| i * i })
    end
  end

  describe '#multiply_els' do
    it 'Returns the multiplication of all elements like in my_inject' do
      expect(multiply_els([1, 2, 3, 4])).to eql([1, 2, 3, 4].inject { |a, b| a * b })
    end
    it 'Output the largest word' do
      expect(%w[cat sheep bear].my_inject do |memo, word|
               memo.length > word.length ? memo : word
             end).to eql('sheep')
    end
  end
end
