=begin

Project 1: Bubble Sort
Author: Ítalo Polazzi Ferreira (itpzzi@gmail.com)

Your Task
--------------
1. Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn't it?).
    > bubble_sort([4,3,78,2,0,2])
    => [0,2,2,3,4,78]
2. Now create a similar method called #bubble_sort_by which sorts an array but accepts a block. The block should take two arguments which represent the two elements currently being compared. Expect that the block's return will be similar to the spaceship operator you learned about before -- if the result of the block is negative, the element on the left is "smaller" than the element on the right. 0 means they are equal. A positive result means the left element is greater. Use this to sort your array.
    > bubble_sort_by(["hi","hello","hey"]) do |left,right|
    >   left.length - right.length
    > end
    => ["hi", "hey", "hello"]

=end

def bubble_sort array
	array.each_index do |i|
		(i+1..array.length-1).each do |j|
			array[i], array[j] = array[j], array[i] if array[i] > array[j]
		end
	end
end
temp = bubble_sort [4,3,78,2,0,2]
p temp.to_s

def bubble_sort_by array
  array.each_index do |i|
    (i+1..array.length-1).each do |j|
      array[i], array[j] = array[j], array[i] if yield(array[i], array[j]) == 1
    end
  end
end
temp = bubble_sort_by [4,3,78,2,0,2] {|left, right| left <=> right}
p temp.to_s