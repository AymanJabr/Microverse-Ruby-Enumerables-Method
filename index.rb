 #Search "ruby understanding self and main"
 
 
 
 module Enumerable
  def my_each
  
    for i in self 
       yield(i)
    end

  end

  def my_each_with_index
  
    for i in self
      yield(i, self.find_index(i))
    end

  end

  def my_select

    my_array = []

    for i in self
      if yield(i)
        my_array << i
      end
    end

    puts my_array

  end

  def my_all?
    if self.length == 0 then
      return true
    end
    my_all_boolean = true
    for i in self

      if !yield(i)
        my_all_boolean = false
      end

    end
    puts my_all_boolean
  end

  def my_any?
    if self.length == 0 then
      return false
    end
    my_any_boolean = false

    for i in self

      if yield(i)
        my_any_boolean = true
      end

    end
    puts my_any_boolean
  end

  def my_none?
    if self.length == 0 then
      return true
    end
    my_none_boolean = true
    for i in self

      if yield(i)
        my_none_boolean = false
      end

    end
    puts my_none_boolean
  end


  def my_count(*args)
    if args.length == 0 then
      return puts self.length
    end

    my_parameter = args.first
    my_count_counter = 0
    for i in self
      if(i == my_parameter) then
        my_count_counter += 1
      end
    end
    puts my_count_counter
  end

  def my_map

    my_array = []
    
    #Replace the .each with my_each

    for i in self
      my_array.push(yield(i))
    end
    my_array

  end


  def my_inject

    my_aggregator = self.first
    
    for i in self do
      if i == self.first then
        next
      end
      my_aggregator = yield(my_aggregator, i)
    end

    puts my_aggregator

  end

  def self.multiply_els(my_array)

    my_array.my_inject {|a,b| a * b}
  end


end


#Testing all the codes,  ADD YOUR TESTS HERE
[1,2,3].my_each { |n| puts n * 3}
[1,2,3].my_each_with_index { |number, index| puts "the number: #{number}, has index: #{index}"}
[1,2,3,4].my_select { |n| n.even?}
[0,2,4,8].my_all? {|n| n.even?}
[1,3,5,7].my_any? {|n| n.even?}
[1,3,5,7].my_none? {|n| n.even?}
[1,3,5,7,1,nil,5,7,1,nil,5,7].my_count
[1,3,5,7,1,nil,5,7,1,nil,5,7].my_count(1)
some_new_array = [1,3,4,8].my_map { |n| n * 3}
some_other_new_array = [1,3,4,8].my_each {|n| n  * 3}
puts some_new_array
puts some_other_new_array
[1,3,5,7].my_inject { |a,b| a + b}


movie = Proc.new {return "something"}
puts movie.call

Enumerable.multiply_els([1,3,4,7,8,12])


  # https://medium.com/rubycademy/the-yield-keyword-603a850b8921

  # https://jsonmattingly.medium.com/writing-your-own-enumerables-in-ruby-18db4fa0e5fe