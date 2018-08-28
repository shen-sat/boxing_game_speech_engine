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

	def build(number_of_enemies)
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
			roster << enemy
		end
		return roster
	
	end
end