# Microverse-Ruby-Enumerables-Method

In this project I re-made some of the most used Ruby Enumerable classes:

1. my_each for each
2. my_select for select
3. my_all? for all?
4. my_any? for any?
5. my_none? for none?
6. my_count for count
7. my_count() for count()
8. my_map for map
9. my_inject for inject

## Built With

Ruby

## Installation

1. Install Ruby on your machine

2. Download and Unzip the folder containing this project, or clone it.

3. See "Usage" below to see how to use the classes

4. In the terminal, navigate to the folder containing the file and run "ruby index.rb"

## Usage

Use the different methods like so.

### my_each

`testarray.my_each { |x| puts "The number is #{x}" }`
Returns every item of your array

### my_each_with_index

`testarray.my_each_with_index { |val,index| puts "index: #{index} for #{val}" }`
Returns every item of your array along with the index

### my_select

`testarray.my_select { |n| n.even? }`
Returns every item of the array that matches your query

### my_all

`puts testarray.my_all { |n| n < 20 }`
Returns true if all the elements of your array match the query

### my_none

`puts testarray.my_none { |n| n < 20 }`
Returns true if all the elements of your array don't match the query

### my_any

`puts testarray.my_any { |n| n == 20 }`
Returns true if at least one element of the array matches the query

### my_count

`puts testarray.my_count { |n| n.even? }`
Returns the number of elements in your array that match the query

### my_map

`square = Proc.new { |x| x**2 }`
`puts testarray.my_map { |x| x**2 }`
`puts testarray.my_map(square)`
Can be used with a block or a proc (prioritizes the proc). Return the modified elements according to the query

### my_inject

`puts testarray.my_inject { |sum, n| sum * n }`
Returns the sum of all the elements according to the query

### multiply_els

`puts multiply_els([2,4,5])`
This method uses my_map to multiply the elements of an array with a sum

## Author 👤

### Ayman Jabr

\_[Github](https://github.com/AymanJabr/)

\_[LinkedIn](https://www.linkedin.com/in/ayman-jabr-3705a4100/)

## Show your support ⭐️⭐️

Give a star if you like this project!

## License 📝

This project is [MIT](https://www.mit.edu/~amini/LICENSE.md) licensed.
