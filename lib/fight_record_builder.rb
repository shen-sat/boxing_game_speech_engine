class FightRecordBuilder
	def initialize(pair_matrix)
		@pair_matrix = pair_matrix
	end

	def build
		fight_record = {}
		@pair_matrix.each do |pair|
			fight_record[pair] = {}
			fight_record[pair][:last_fight_winner] = nil
			# fight_record[pair][:last_fight_win_method] = nil
			# fight_record[pair][:last_fight_no_of_rounds] = nil
		end
		return fight_record
	end
end