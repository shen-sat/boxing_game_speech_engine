require 'set'

class QueryBuilder

	def initialize(fighter, opponent, fight_record)
		@fighter = fighter
		@opponent = opponent
		pair = [fighter, opponent].to_set
		@history = fight_record[pair] 
	end

	def build
		query = {}
		query[:fighter] = @fighter
		query[:opponent] = @opponent
		query[:history] = @history
		return query
	end

end