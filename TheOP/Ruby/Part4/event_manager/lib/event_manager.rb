require 'csv'
require 'erb'

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end

def saving_the_letter(id, letter)
	# Creating the output directory if it doesn't already exist
	Dir.mkdir("output") unless Dir.exist? "output"

	# Setting up the name of the output file with each user's id
	filename = "output/thanks_#{id}.html"

	# Writting the result in "form_letter" in your respective file
	File.open(filename, 'w') {|f|
		f.puts letter
	}
end

file = "../event_attendees.csv"
if File.exist? file
	
	template_letter = File.read "../form_letter.html.erb"
	erb_template = ERB.new template_letter
	
	(CSV.open(file, headers: true, header_converters: :symbol)).each {|row|
		# Attr
		id, name, zipcode = row[0], row[:first_name], clean_zipcode(row[:zipcode])
		
		# Creating the form_letter from the erb template's result
		form_letter = erb_template.result(binding)

		saving_the_letter id, form_letter
	}
else
	puts "Not finded!"
end
