win_array = [[1,2,3], [2,3,4],[1,3,5]]
#puts win_array[0]
my_array = [1,3,5,8,9]


for x in (0...win_array.length)
	puts (my_array & win_array[x]).length
end