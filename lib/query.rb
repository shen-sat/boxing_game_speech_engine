class Query
	attr_reader :fighter, :opponent, :history

	def initialize(fighter, opponent, fight_record)
		@fighter = fighter
		@opponent = opponent
		pair = [fighter, opponent].to_set
		@history = fight_record[pair]
	end

  def opponent_is_lower_ranked
		fighter.rank < opponent.rank
	end

  def opponent_is_higher_ranked
		fighter.rank > opponent.rank
		end

	def opponent_is_younger
		fighter.age - opponent.age > 10
	end

  def opponent_is_older
		opponent.age - fighter.age > 10
	end

end