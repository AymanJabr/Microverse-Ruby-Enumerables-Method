# Search "ruby understanding self and main"

module Enumerable
  def my_each(&block)
    each(&block)
  end

  def my_each_with_index
    each do |i|
      yield(i, find_index(i))
    end
  end

  def my_select
    my_array = []

    each do |i|
      my_array << i if yield(i)
    end

    puts my_array
  end

  def my_all?
    return true if length.zero?

    my_all_boolean = true
    each do |i|
      my_all_boolean = false unless yield(i)
    end
    puts my_all_boolean
  end

  def my_any?
    return false if length.zero?

    my_any_boolean = false

    each do |i|
      my_any_boolean = true if yield(i)
    end
    puts my_any_boolean
  end

  def my_none?
    return true if length.zero?

    my_none_boolean = true
    each do |i|
      my_none_boolean = false if yield(i)
    end
    puts my_none_boolean
  end

  def my_count(*args)
    return puts length if args.length.zero?

    my_parameter = args.first
    my_count_counter = 0
    each do |i|
      my_count_counter += 1 if i == my_parameter
    end
    puts my_count_counter
  end

  def my_map_prock(block)
    my_array = []

    # Replace the .each with my_each

    each do |i|
      my_array.push(block.call(i))
    end
    my_array
  end

  def my_map(block = nil)
    return my_map_prock(block) unless block.nil?

    my_array = []

    # Replace the .each with my_each

    each do |i|
      my_array.push(yield(i))
    end
    my_array
  end

  def my_inject
    my_aggregator = first

    each do |i|
      next if i == first

      my_aggregator = yield(my_aggregator, i)
    end

    puts my_aggregator
  end

  def self.multiply_els(my_array)
    my_array.my_inject { |a, b| a * b }
  end
end

# Testing all the codes,  ADD YOUR TESTS HERE
[1, 2, 3].my_each { |n| puts n * 3 }
[1, 2, 3].my_each_with_index { |number, index| puts "the number: #{number}, has index: #{index}" }
[1, 2, 3, 4].my_select(&:even?)
[0, 2, 4, 8].my_all?(&:even?)
[1, 3, 5, 7].my_any?(&:even?)
[1, 3, 5, 7].my_none?(&:even?)
[1, 3, 5, 7, 1, nil, 5, 7, 1, nil, 5, 7].my_count
[1, 3, 5, 7, 1, nil, 5, 7, 1, nil, 5, 7].my_count(1)
some_new_array = [1, 3, 4, 8].my_map { |n| n * 3 }
some_other_new_array = [1, 3, 4, 8].my_each { |n| n * 3 }
puts some_new_array
puts some_other_new_array
[1, 3, 5, 7].my_inject { |a, b| a + b }
Enumerable.multiply_els([1, 3, 4, 7, 8, 12])
movie = proc { |i| i + 4 }
puts [2, 3, 5, 6, 8].my_map(movie)
