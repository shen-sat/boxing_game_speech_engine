class Reader

	def see_roster(roster)
		puts "\n"
		rows = []
		sorted_roster = roster.sort_by {|fighter| fighter.rank} 
		sorted_roster.each do |fighter|
			rows << 	[	fighter.rank,
							fighter.name, 
							fighter.lastname,
							fighter.nickname,
							fighter.age
						]
		end
		headings = ["Rank", "Name", "Lastname", "Nickname", "Age"]
		table = Terminal::Table.new :headings => headings, :rows => rows
		puts table
		puts "\n"
	end


end