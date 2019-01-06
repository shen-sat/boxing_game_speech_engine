class RuleChecker
	attr_reader :fighter, :opponent, :history

	def initialize(fighter, opponent, fight_record)
		@fighter = fighter
		@opponent = opponent
		pair = [fighter, opponent].to_set
		@history = fight_record[pair]
	end

	def opponent_is_older
		fighter.age < opponent.age
	end

	def opponent_won_last_fight
		history[:last_fight_winner] == opponent
	end
end