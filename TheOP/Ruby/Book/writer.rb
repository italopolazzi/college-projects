message = gets
File.open("file.txt", "w") {|f|
	f.puts message
}
