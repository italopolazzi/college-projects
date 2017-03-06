require 'json'

class Test
	def initialize name, lastname, age, hobbies
		@age = age
		@hobbies = hobbies
		@lastname = lastname
		@name = name
	end
	
	def to_s
		"In #{self.class.name}: \n #{@name}, #{@lastname}, #{@age}, #{@hobbies}"
	end

	def to_json(*a)
		{
			json_class: self.class.name,
			data: {
				name: @name,
				lastname: @lastname,
				age: @age,
				hobbies: @hobbies
			}
		}.to_json(*a)
	end

	def self.json_create(i)
		new(i[:data][:name], i[:data][:lastname], i[:data][:age], i[:data][:hobbies])
	end
end

test = Test.new "Italo", "Polazzi", 19, [:programming, :listening_music, :watch_series]
puts test.to_json
#puts test.to_s

#p (YAML::load(test)).inspect