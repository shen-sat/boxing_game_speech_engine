class FightRecordBuilder
	def initialize(pair_matrix)
		@pair_matrix = pair_matrix
	end

	def build
		fight_record = {}
		@pair_matrix.each do |pair|
			fight_record[pair] = {}
			fight_record[pair][:last_fight_winner] = nil
			fight_record[pair][:last_fight_win_method] = nil
			fight_record[pair][:last_fight_no_of_rounds] = nil
			# first_fighter = pair.to_a[0]
			# second_fighter = pair.to_a[1]
			# fight_record[pair][first_fighter] = {}
			# fight_record[pair][second_fighter] = {}
			# fight_record[pair][first_fighter][:no_of_wins] = nil
			# fight_record[pair][second_fighter][:no_of_wins] = nil
		end
		return fight_record
	end
end