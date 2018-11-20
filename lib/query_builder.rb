class QueryBuilder

	def initialize(fighter, opponent, fight_record)
		@fighter = fighter
		@opponent = opponent
		@fight_record = fight_record 
	end

	def build
		query = {}
		query[:fighter] = @fighter
		query[:opponent] = @opponent
		query[:fight_record] = @fight_record
		return query
	end
end