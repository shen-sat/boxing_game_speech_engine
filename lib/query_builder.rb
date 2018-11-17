class QueryBuilder

	def initialize(fighter, enemy, fight_record)
		@fighter = fighter
		@enemy = enemy
		@fight_record = fight_record 
	end

	def build
		query = {}
		query[:fighter] = @fighter
		query[:enemy] = @enemy
		query[:fight_record] = @fight_record
		return query
	end
end