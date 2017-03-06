def merge a, b, c; i=0
	until (b.size == 0 or c.size == 0)
		res = (c[0] <=> b[0])
		a[i] = b.shift if res == 1
		a[i] = c.shift unless res == 1
		i+=1
	end; [b,c].each {|s| s.each {|n| a[i] = n; i+=1}}
end
def merge_sort arr
	if arr.size > 1				# if array may be sliced in integers parts
		brr, crr = arr[0, arr.size/2], arr[arr.size/2, arr.size]
		merge_sort brr			# left arrays
		merge_sort crr			# right arrays
		merge arr, brr, crr 	# sort
	end; arr
end
p merge_sort [82,77,2,22,3,61,7,11,61,62,-11,4,5,0,77]