
99.times do |n|
	y = 1980 + rand(50)
	m = rand(11)
	d = rand(31)

	puts "#{n}. #{y} | #{m} | #{d} |" 
	puts Time.new(y, m, d)
end