module Enumerable
	
	def my_each
		for i in self
			yield i
		end
	end
	
	def my_each_with_index
		for n in 0..self.size
			yield self[n], n if block_given?
		end
	end
	
	def my_select
		temp = []
		self.my_each { |i| temp.push(i) if yield(i)}
		temp
	end
	
	def my_all?(&block)
		block = Proc.new {|obj| obj} if not block_given?
		test = true
		self.my_each do |x|
			unless block.call(x)
				test = false
				break
			end
		end
		test
	end
	
	def my_any?(&block)
		block = lambda {|obj| obj} if not block_given?
		test = false
		self.my_each do |x|
			if block.call(x)
				test = true
				break
			end
		end
		test
	end
	
	def my_none?(&block)
		block = lambda {|obj| obj} if not block_given?
		test = true
		self.my_each do |x|
			if block.call(x)
				test = false
				break
			end
		end
		test
	end
	
	def my_count(num=false, &block)
		count = 0
		if num
			self.my_each {|x| count += 1 if x == num}
		elsif block_given?
			self.my_each {|x| count += 1 if block.call(x)}
		else
			count = self.size
		end
		count
	end
	
	def my_map proc=nil, &block
		temp = []
		#Giving priority to proc if both was statemented
		if not proc.nil?
			self.my_each {|i| temp << proc.call(i)}
		elsif block_given?
			self.my_each {|i| temp << block.call(i)}
		end
		temp
	end
	
	#incomplete
	def my_inject n=0, &block
		memo = n
		self.my_each do |x|
			memo = block.call(memo, x)
		end
		memo
	end
	
end