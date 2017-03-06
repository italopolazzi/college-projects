require 'yaml'

class Test
	attr_reader :name, :lastname, :hobbies
	def initialize name, lastname, age, hobbies
		@age = age
		@hobbies = hobbies
		@lastname = lastname
		@name = name
	end
	
	def to_s
		"In #{self.class.name}: \n #{@name}, #{@lastname}, #{@age}, #{@hobbies}"
		#"In A:\n   #{@string}, #{@number}\n"
	end


	def to_yaml
		YAML::dump(self)
	end
end

test = Test.new "Italo", "Polazzi", 19, [:programming, :listening_music, :watch_series]
test = test.to_yaml
puts YAML::load(test).lastname
#puts test.to_s

#p (YAML::load(test)).inspect