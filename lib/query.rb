class Query
	attr_reader :fighter, :opponent, :history

	def initialize(fighter, opponent, fight_record)
		@fighter = fighter
		@opponent = opponent
		pair = [fighter, opponent].to_set
		@history = fight_record[pair]
	end

end