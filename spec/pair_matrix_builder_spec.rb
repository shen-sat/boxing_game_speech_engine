# require_relative '../lib/pair_matrix_builder.rb'

# describe 'pair matrix builder class' do
	
# 	let	(:names)		{ ["Conor", "Frankie", "Chad"] }
# 	let	(:lastnames)	{ ["McGregor", "Edgar", "Mendes"] }
# 	let	(:nicknames)	{ ["The Notorious", "The Answer", "Rampage"] }
# 	let	(:age_range)	{ (18..40) }
# 	let (:player)		{ Player.new } 
		
# 	let	(:roster_builder)	{RosterBuilder.new(	names: names.dup, 
# 												lastnames: lastnames.dup, 
# 												nicknames: nicknames.dup, 
# 												age_range: age_range.dup)
# 							}		

# 	let (:roster)			{roster_builder.build(3, player)}

# 	context 'when given a roster of size 4' do
# 		let (:pair_matrix)	{ PairMatrixBuilder.new(roster).build }	

		
		
# 		it 'should create 6 pairs' do
# 			roster.each {|fighter| puts fighter.name unless fighter == player}
# 			expect(pair_matrix.size).to eq(6)
# 			pair_matrix.each do |pair|
# 				expect(pair.size).to eq(2)
# 			end
# 		end

# 	end
	
# end