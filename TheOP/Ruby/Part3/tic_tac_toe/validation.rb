def continue? mtx
	continue = []
	[:rows, :cols, :dgns].each {|v|
		temp = []
		case v
			when :rows then mtx.row_size.times {|i| temp << mtx.row(i)}
			when :cols then mtx.column_size.times {|i| temp << mtx.column(i)}
			when :dgns
				2.times {|i|
					t = []
					mtx.row_size.times {|j|
						t << ((i == 0) ? mtx[j,j] : mtx[j,-j-1])
					}
					temp << t
				}
		end
		#Calling the method and setting the scan result
		result = to_verify temp.to_a, v
		
		if result.kind_of? Hash
			@result = result
			return true
		else
			continue << result
		end
	}
	continue.any?
end

def to_verify mtx, type
	continue = []
	mtx.each_with_index {|arr,i| 
		if arr.all? {|x| (x == arr[0] and x != 0)}
			return {type: type, index: i, id: arr[0]} 
		else
			continue << arr.any? {|x| x == 0}
		end
	}
	continue.any?
end

def winner?; not @result.nil?; end