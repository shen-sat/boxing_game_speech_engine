class Checks
	attr_reader :fighter, :opponent, :history

	def initialize(query)
		@fighter = query[:fighter]
		@opponent = query[:opponent]
		@history = query[:history]
	end

	def opponent_is_older
		fighter.age < opponent.age
	end

	def opponent_won_last_fight
		history[:last_fight_winner] == opponent
	end
end