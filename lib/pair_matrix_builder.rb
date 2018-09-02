class PairMatrixBuilder
	attr_reader :roster

	def initialize(roster)
		@roster = roster
	end

	def build
        pair_matrix = roster.combination(2).to_a
	    pair_matrix_in_sets = []
	    pair_matrix.each {|pair| pair_matrix_in_sets << pair.to_set}
	    return pair_matrix_in_sets
	end

end