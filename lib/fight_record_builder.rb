class FightRecordBuilder
	attr_reader :win_methods, :rounds, :wins

	def initialize(pair_matrix)
		@pair_matrix = pair_matrix
		@win_methods = ['KO', 'DQ', 'Decision']
		@rounds = (1..12).to_a
		@wins = (1..3).to_a
	end

	def build
		fight_record = {}
		@pair_matrix.each do |pair|
			fight_record[pair] = {}
			fight_record[pair][:last_fight_winner] = pair.to_a.sample
			fight_record[pair][:last_fight_win_method] = win_methods.sample
			fight_record[pair][:last_fight_no_of_rounds] = rounds.sample
			first_fighter = pair.to_a[0]
			second_fighter = pair.to_a[1]
			fight_record[pair][first_fighter] = {}
			fight_record[pair][second_fighter] = {}
			fight_record[pair][first_fighter][:no_of_wins] = wins.sample
			fight_record[pair][second_fighter][:no_of_wins] = wins.sample
		end
		return fight_record
	end
end