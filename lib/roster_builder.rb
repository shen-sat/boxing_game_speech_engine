class RosterBuilder
	attr_accessor 	:enemy_builder, :names, :lastnames, 
					:nicknames, :age_range

	def initialize(names:, lastnames:, nicknames:, age_range:)
		@enemy_builder = EnemyBuilder.new
		@names = names
		@lastnames = lastnames
		@nicknames = nicknames
		@age_range = age_range
	end

	def build(number_of_enemies, player)
		roster = []
		number_of_enemies.times do
			name = names.delete_at(rand(names.length))
			lastname = lastnames.delete_at(rand(lastnames.length))
			nickname = nicknames.delete_at(rand(nicknames.length))
			age = rand(age_range)
			rank = (0..(number_of_enemies-1)).to_a.delete_at((0..(number_of_enemies-1)).to_a.length)
			enemy = enemy_builder	.set_name(name)
									.set_lastname(lastname)
									.set_age(age)
									.set_rank(rank)
									.set_nickname(nickname)
									.build
			redo if duplicate_names?(roster, enemy)
			roster << enemy
		end
		roster << player
		return roster
	
	end

	def add_player(roster, player)
		return roster << player
	end

	def duplicate_names?(roster, new_enemy)
		duplicate_found = false
		roster.each do |enemy|
			duplicate_found = true if (enemy.name == new_enemy.name && enemy.lastname == new_enemy.lastname)
		end
		return duplicate_found
	end

end