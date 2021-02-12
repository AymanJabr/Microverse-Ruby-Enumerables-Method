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

  def my_all?(*args)
    # ['car', 'cat'].all?(/a/) == ['car', 'cat'].my_all?(/a/)

    if args.length == 1 && args.first.instance_of?(Regexp)
      my_all_boolean = true
      each do |i|
        my_all_boolean = false unless args.first.match(i)
      end
      return my_all_boolean
    end

    if args.length == 1
      my_all_boolean = true
      each do |i|
        my_all_boolean = false unless i.is_a?(args.first.class)
      end
      return my_all_boolean
    end

    unless block_given?
      my_all_boolean = true
      each do |i|
        my_all_boolean = false unless i
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
    if args.length == 1 && !block_given?

      if args.first.instance_of?(Regexp)
        my_any_boolean = false
        each do |i|
          my_any_boolean = true if args.first.match(i)
        end
        return my_any_boolean
      end

      my_any_boolean = false
      each do |i|
        my_any_boolean = true if i == (args.first)
      end
      return my_any_boolean
    end
    unless block_given?
      my_any_boolean = false
      each do |i|
        my_any_boolean = true if i
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
    if args.length == 1 && !block_given?

      if args.first.instance_of?(Regexp)
        my_none_boolean = true
        each do |i|
          my_none_boolean = false if args.first.match(i)
        end
        return my_none_boolean
      end

      my_none_boolean = true
      each do |i|
        my_none_boolean = false if i == args.first
      end
      return my_none_boolean
    end

    unless block_given?
      my_none_boolean = true
      each do |i|
        my_none_boolean = false if i
      end
      return my_none_boolean
    end

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
    if args.length.zero? && !block_given?
      return size if is_a? Range

      return length
    end

    if block_given?
      my_count_counter = 0
      each do |i|
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
    return to_enum(:my_map) unless block_given?
    return my_map_prock(block) unless block.nil?

    my_array = []

    each do |i|
      my_array.push(yield(i))
    end
    my_array
  end

  def my_inject(*args)
    return my_inject { |n, i| n.send(args.first, i) } if args.length == 1 && !block_given?

    if args.length == 2 && !block_given?
      my_aggregator = args.first

      each do |i|
        my_aggregator = my_aggregator.send(args[1], i)
      end

      return my_aggregator
    end

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

puts %w[dog cat].none?(/x/) == %w[dog cat].my_none?(/x/)
