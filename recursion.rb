

def range(start, finish)
  return [start] if finish - 1 == start

  arr = range(start, finish - 1)
  arr << arr[-1] + 1
end

def range_iterative(start,finish)
  result = []
  (finish - start).times do |n|
    result << start + n
  end

  result
end

def exponentiation(num,exponent)
  return 1 if exponent == 0

  num * exponentiation(num, exponent - 1)
end


def exp_2(num,exponent)
  return 1 if exponent == 0
  return num if exponent == 1

  if exponent.even?
    exp_2(num, exponent / 2) ** 2
  else
    num * (exp_2(num,(exponent - 1) / 2) ** 2)
  end
end


class Array

  def deep_dup
    result = []

    each do |el|
      if el.is_a?(Array)
        result << el.deep_dup
      else
        result << el
      end
    end

    result
  end

end

def fib_seq(n)
  return [0] if n == 0
  return [0, 1] if n == 1

  arr = fib_seq(n-1)
  arr << arr[-1] + arr[-2]
end

def fib_seq_it(n)
  return [0] if n == 0

  result = [0, 1]
  until result.length == n+1
    result << result[-1] + result[-2]
  end

  result
end

def subsets(array)
  return [[]] if array.empty?

  new_array = subsets(array[0...-1])

  new_array.push([array.last])

  (1...array.length).each do |num|
    array[0...-1].each_cons(num) do |sub_array|
      new_array << sub_array + [array.last]
    end
  end

  new_array

end

def subsets_2(array)
  return [[]] if array.empty?

  pivot_array = [array.last]
  left_array = subsets_2(array[0...-1])
  right_array = left_array.map {|el| (el + pivot_array)}


  left_array + right_array

end
[1,2,3] [2,1,3] [2,3,1] [1,3,2] [3,1,2] [3,2,1]

[1,2,3,4] [1,3,2,4] [1,3,4,2]

[1,  2, 3,4]

1 [3,2,4]

1 [3,4,2]     [2,1,3,4]




# def permutations(arr)
#
#   return [arr,arr.reverse] if arr.length == 2
#   result = []
#
#   p arr2 = arr[0..1]
#   arr.reject {|el| arr2.include?(el)}.each do |el|
#     result = permutations(arr2).map {|sub| sub << el }
#
#   end
#
#   result
# end

def subsets(array)
    return [[]] if array.empty?
    subs = subsets(array.take(array.length - 1))

    subs.concat(subs.map { |sub| sub + [array.last] })
end

def permutations(array,permutes=[])
  return [[]] if array.empty?
  return permutes << array if array.length == 1
  return permutes if (1..array.length).reduce(:*) == permutes.length
  pivot = array.shift
  array.length.times do |index|
    permutes << array.dup.insert(index,pivot) if !permutes.include?(array.dup.insert(index,pivot))
  end
  array.insert(array.length - 2,pivot)
  permutations(array,permutes.uniq)

end


def permutations(array)
  return [] if array.empty?
 permutes = []

    first_element = array.first

     permutes << [first_element] + permutations(array[1..-1])

     permutes
  end


def permutes(array)
  return [] if array.empty?
  return [array, array.reverse] if array.length == 1

  subs = array.take(array.length - 1)

  last_ele = array.last
  sub_permutes = permutes(subs)


  sub_permutes.map do |sub_permute|
    subs.length.times do |index|
      sub_permute.insert(index,last_ele)
    end
  end

  sub_permutes
end
