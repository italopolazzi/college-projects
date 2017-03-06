module MyModule
	def getsWithMessage(str=nil)
		if not str.nil?
			puts str
		elsif block_given?
			puts yield
		end
		gets.chomp
	end
	
	def makeProcWithNew(callProc=true)
		prok = Proc.new {return "I have created a new Proc!"}
		prok.call if callProc
		return "And seems that the variable \"callProc\" has been set up to false."
	end

	def makeProcWithLambda(callProc=true)
		prok = lambda {return "I have created a new Proc!"}
		prok.call if callProc
		return "And seems that the variable \"callProc\" stayed in default value."
	end
end