file = "file.txt"
#text = gets
lam = lambda {|f| 
	text = gets
	f.puts text
}

begin
	File.open(file, "w+").call(&lam)
rescue => e
	e.message
end