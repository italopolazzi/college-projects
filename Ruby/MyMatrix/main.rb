require_relative 'classes'
#array = Array.new(size) {Array.new(size, )}
#puts array.to_readable
#array = [2,2,2]
#array.all? {|x| x == array[0] and x != 0}

=begin	
m = MyMatrix.new({row: 3}) { ((100 % rand) * 100).to_i }
puts m.to_readable
print "Insert the row that you want to return: "
n = gets.to_i
puts m[n].inspect
puts m.get n,n
=end

m = Matrix.build(3) {0}
m[1,1] = 1
m[1,2] = 2
puts m.to_readable
puts m[1,1]