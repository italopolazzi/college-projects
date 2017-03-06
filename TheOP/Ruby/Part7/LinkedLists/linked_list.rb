class Node
	attr_accessor :next_node, :value
	def initialize value, next_node=nil
		@value = value
		@next_node = next_node
	end
end

class LinkedList
	attr_reader :size, :head, :tail
	def initialize; @head, @tail, @size = nil, @head, 0; end

	def append value=nil
		temp = Node.new value
		if @head.nil?
			@head = temp
			@tail = @head
		else
			@tail.next_node, @tail = temp, temp
		end
		@size += 1; true
	end

	def at index
		raise "Invalid index format." unless index.is_a? Integer
		return nil if index >= @size
		walks {|x, i| return x if i == index}; nil
	end

	def contains? value
		walks {|x| return true if x.value == value}; false
	end

	def find value
		walks {|x, i| return i if x.value == value}; nil
	end

	def insert_at index, value
		prepend value if index == 0
		at(index-1).next_node = Node.new(value, at(index)); true
	end

	def pop
		raise "Impossible remove. Empty list!" if @size == 0
		if @tail == @head
			@tail = nil
			@head = nil
		else
			@tail = self.at(@size-2)
			@tail.next_node = nil
		end
		@size-=1; true
	end

	def prepend value=nil
		return self.append value if @head.nil?
		temp = Node.new value
		temp.next_node, @head = @head, temp
		@size += 1; true
	end

	def remove_at index
		raise "Invalid index" unless index.between?(0,@size-1)
		if index == 0; @head = @head.next_node 
		else		
			node = at(index-1)
			node.next_node = node.next_node.next_node
		end; true
	end

	def to_s; walks {|x| print "(#{x.value}) -> "}; print "nil"; end

	private 
		def walks
			aux, i = @head, 0
			(yield aux, i; i+=1; aux = aux.next_node) while aux
		end
end

l = LinkedList.new
german_numbers = %w{Null Eins Zwein Drei Vier Fünf Sechs Siebe Acht Neun Zehn Elf Zwölf Dreizehn}
german_numbers.each_with_index {|n,i|
	l.append n unless i.even?
	l.prepend n unless i.odd?
}

puts l.to_s
l.pop
puts l.to_s
l.pop
puts l.to_s
l.remove_at 3
puts l.to_s
puts l.contains? "Siebe"
l.insert_at 3, "Sechs"
puts l.to_s
puts l.find("Sechs")
