require 'set'

class QueryBuilder

	def build(fighter, opponent, fight_record)
		pair = [fighter, opponent].to_set
		@history = fight_record[pair]
		query = {}
		query[:fighter] = fighter
		query[:opponent] = opponent
		query[:history] = @history
		return query
	end

end