class Matchmaker
	attr_accessor :roster

	def initialize(roster)
		@roster = roster
	end

	def pick_two_fighters
		first_fighter = roster.delete_at(roster.sample)
		puts first_fighter
		second_fighter = roster.delete_at(roster.sample)
		puts second_fighter
		puts "HEY!"
		return [first_fighter, second_fighter]
	end
end