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

	def see_fight_record(fight_record)
		puts "\n"
		fight_record.each do |key, value|
			rows = []
			headings = []
			puts "\n"
			last_fight_winner = fight_record[key][:last_fight_winner]
			last_fight_win_method = fight_record[key][:last_fight_win_method]
			last_fight_no_of_rounds = fight_record[key][:last_fight_no_of_rounds]
			first_fighter = key.to_a[0]
			second_fighter = key.to_a[1]
			first_fighter_no_of_wins = fight_record[key][first_fighter][:no_of_wins]
			second_fighter_no_of_wins = fight_record[key][second_fighter][:no_of_wins]
			rows << [	"#{key.to_a[0].name} '#{key.to_a[0].nickname}' #{key.to_a[0].lastname}" +
						"\n#{key.to_a[1].name} '#{key.to_a[1].nickname}' #{key.to_a[1].lastname}",  
						"#{last_fight_winner}",
						"#{last_fight_win_method}",
						"#{last_fight_no_of_rounds}",
						"#{first_fighter_no_of_wins}",
						"#{second_fighter_no_of_wins}"
					]
			headings << [	"Pair",
							"Last Fight Winner",
							"Last Fight Win Method",
							"Last Fight No Of Rounds",
							"#{key.to_a[0].name} wins",
							"#{key.to_a[1].name} wins"
						]
		table = Terminal::Table.new :headings => headings, :rows => rows
		puts table
		puts "\n"
		end
		puts "\n"
	end


end