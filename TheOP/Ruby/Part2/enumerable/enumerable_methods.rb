=begin

Project 2: Enumerable Methods
Author: Ítalo Polazzi Ferreira (itpzzi@gmail.com)

Your Task
--------------
1. Create a script file to house your methods and run it in IRB to test them later.
2. Add your new methods onto the existing Enumerable module. Ruby makes this easy for you because any class or module can be added to without trouble ... just do something like:

    module Enumerable
      def my_each
        # your code here
      end
    end
3. Create #my_each, a method that is identical to #each but (obviously) does not use #each. You'll need to remember the yield statement. Make sure it returns the same thing as #each as well.
4. Create #my_each_with_index in the same way.
5. Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
6. Create #my_all? (continue as above)
7. Create #my_any?
8. Create #my_none?
9. Create #my_count
10. Create #my_map
11. Create #my_inject
12. Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
13. Modify your #my_map method to take a proc instead.
14. Modify your #my_map method to take either a proc or a block. It won't be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn't have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.

Quick Tips
--------------
- Remember yield and the #call method.

=end

#load 'enumerable.rb'
require "./enumerable"
#require_relative "enumerable"

array = (5..10).to_a
# -- my_each
#array.each {|x| print "#{x}, "}

# -- my_each_with_index
#array.my_each_with_index {|x, ind| print "[#{ind}]: #{x}, "}

# -- my_all?
#puts [7, 4, 5, 8, 1, 8].my_all? {|x| x <= 3}
#puts [3, 4, 5, nil, 1, 2, 4].my_all?

# -- my_any?
#puts [7, 4, 5, 8, 1, 8].my_any? {|x| x <= 3}
#puts [3, 4, 5, nil, 1, 2, 4].my_any?

# -- my_none?
#puts [7, 4, 5, 8, 1, 8].my_none? {|x| x <= -1}
#puts [nil, false, 3].my_none?


# -- my_select
#print array.my_select {|x| x % 7 == 0}

# -- my_count
#ary = [1, 2, 4, 2]
#print ary.my_count
#print ary.my_count(2)
#print ary.my_count {|x| x % 2 == 0}

# -- my_map
proc_test = nil#Proc.new {|x| x - 1}
print array.my_map(proc_test) {|x| x - 100}

# incomplete -- my_inject
#print array.my_inject(Math::PI) {|product, n| product * n}
