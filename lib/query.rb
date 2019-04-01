class Query
	attr_reader :fighter, :opponent, :history

	def initialize(fighter, opponent, fight_record)
		@fighter = fighter
		@opponent = opponent
		pair = [fighter, opponent].to_set
		@history = fight_record[pair]
	end

  def opponent_has_few_fights
		opponent.no_of_fights < 3
	end

  def opponent_is_top_ranked
		opponent.rank < 4
	end

  def opponent_won_last_fight
		history[:last_fight_winner] == opponent
	end

  def fighter_about_to_retire
		fighter.age > 39 && fighter.no_of_fights > 29
	end

  def fighter_is_champ
		fighter.rank == 0
	end

  def opponent_is_young
		opponent.age < 20
	end

end