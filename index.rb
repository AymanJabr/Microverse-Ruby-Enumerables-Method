# Search "ruby understanding self and main"

module Enumerable
  def my_each(&block)
    each(&block)
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    each do |i|
      yield(i, find_index(i))
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    my_array = []

    each do |i|
      my_array << i if yield(i)
    end

    my_array
  end

  # def my_all_with_arugments?(arguments)
  #   my_all_boolean = true
  #   arguments.each do |i|
  #     my_all_boolean

  # end

  def my_all?(*args)
    return true if length.zero?

    if args.length == 1
      my_all_boolean = true
      each do |i|
        my_all_boolean = false unless i.is_a?(args.first)
      end
      return my_all_boolean
    end

    my_all_boolean = true
    each do |i|
      my_all_boolean = false unless yield(i)
    end
    my_all_boolean
  end

  def my_any?(*args)
    return false if length.zero?

    if(args.length == 1) then
      my_any_boolean = false
      each do |i| 
        if i.is_a? (args.first) then
          my_any_boolean = true
        end
      end
      return my_any_boolean
    end

    my_any_boolean = false

    each do |i|
      my_any_boolean = true if yield(i)
    end
    my_any_boolean
  end

  def my_none?(*args)
    return true if length.zero?

    if args.length == 1
      my_none_boolean = true
      each do |i|
        my_none_boolean = false if i.is_a?(args.first)
      end
      return my_none_boolean

    end

    my_none_boolean = true
    each do |i|
      my_none_boolean = false if yield(i)
    end
    my_none_boolean
  end

  def my_count(*args)
    return puts length if (args.length.zero? && !block_given?)

    if(args.length.zero? && block_given?) then 
      my_count_counter = 0
      self.each do |i|
        my_count_counter += 1 if yield(i)
      end
      return my_count_counter
    end

    my_parameter = args.first
    my_count_counter = 0
    each do |i|
      my_count_counter += 1 if i == my_parameter
    end
    my_count_counter
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

  def my_inject(*args)
    if args.length == 1
      my_aggregator = args.first

      each do |i|
        my_aggregator = yield(my_aggregator, i)
      end

      return my_aggregator
    end

    my_aggregator = first

    each do |i|
      next if i == first

      my_aggregator = yield(my_aggregator, i)
    end

    my_aggregator
  end

  def self.multiply_els(my_array)
    my_array.my_inject { |a, b| a * b }
  end
end

# Testing all the codes,  ADD YOUR TESTS HERE
the_best_array_in_the_world = [1, 2, 3, 4, 5]
