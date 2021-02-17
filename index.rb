module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    k = 0
    while k < to_a.length
      yield to_a[k]
      k += 1
    end
    self
  end

  def my_each_with_index(_argument = nil)
    return to_enum(:my_each_with_index) unless block_given?

    if block_given?
      0.upto(size - 1) do |i|
        yield(to_a[i], i)
      end
    end; self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    my_array = []

    each do |i|
      my_array << i if yield(i)
    end

    my_array
  end

  # rubocop:disable Metrics/MethodLength

  def my_all?(*args)
    # Checks for Regexp
    if args.length == 1 && args.first.instance_of?(Regexp)
      my_all_boolean = true
      each do |i|
        my_all_boolean = false unless args.first.match(i)
      end
      return my_all_boolean
    end
    # Checks for Class type and for a specific character
    if args.length == 1

      # If we passed in a class
      if args.first.is_a?(Class)
        my_all_boolean = true
        each do |i|
          my_all_boolean = false unless i.is_a?(args.first)
        end
        return my_all_boolean
      end

      # If just a specific character is given
      my_all_boolean = true
      each do |i|
        my_all_boolean = false unless i == args.first
      end
      return my_all_boolean
    end

    # Checks for when a block is not given
    unless block_given?
      my_all_boolean = true
      each do |i|
        my_all_boolean = false unless i
      end
      return my_all_boolean
    end

    # If a block is given
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

      if args.first.instance_of?(Class)
        my_any_boolean = false
        each do |i|
          my_any_boolean = true if i.is_a?(args.first)
        end
        return my_any_boolean
      end

      my_any_boolean = false
      each do |i|
        my_any_boolean = true if i == args.first
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

      if args.first.instance_of?(Class)
      my_none_boolean = true
      each do |i|
        my_none_boolean = false if i.is_a?(args.first)
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
        puts i.is_a?(args.first)
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

  def my_inject(arg = nil, sym = nil)
    if (arg.is_a?(String) || arg.is_a?(Symbol)) && (!arg.nil? && sym.nil?)
      sym = arg
      arg = nil
    end
    if !block_given? && !sym.nil?
      my_each { |s| arg = arg.nil? ? s : arg.send(sym, s) }
    else
      my_each { |s| arg = arg.nil? ? s : yield(arg, s) }
    end
    arg
  end

  # rubocop:enable Metrics/MethodLength

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
end

def multiply_els(*args)
  return args.first.my_inject { |a, b| a * b } if args.length == 1

  my_inject { |a, b| a * b }
end
