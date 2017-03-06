file, header = ARGV[0], ARGV[1]
if File.exists? file
	lines = File.open(file, "r").readlines
	f = File.open(file, "w+")
	f.puts "#{header}" unless header.nil?
	lines.each_with_index {|line, ind| f.puts "#{ind+1} - #{line}"}
	f.close
else
	puts "File not found!"
end
