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
							fighter.age,
							fighter.no_of_fights
						]
		end
		headings = ["Rank", "Name", "Lastname", "Nickname", "Age", "No of Fights"]
		table = Terminal::Table.new :headings => headings, :rows => rows
		puts table
		puts "\n"
	end

	def see_fight_record(fight_record)
		puts "\n"
		fight_record.each do |key, value|
			rows = []
			headings = []
			puts "\n"
			last_fight_winner = fight_record[key][:last_fight_winner]
			rows << [	"#{key.to_a[0].name} '#{key.to_a[0].nickname}' #{key.to_a[0].lastname}" +
						"\n#{key.to_a[1].name} '#{key.to_a[1].nickname}' #{key.to_a[1].lastname}",  
						"#{last_fight_winner}"
					]
			headings << [	"Pair",
							"Last Fight Winner"
						]
		table = Terminal::Table.new :headings => headings, :rows => rows
		puts table
		puts "\n"
		end
		puts "\n"
	end


end