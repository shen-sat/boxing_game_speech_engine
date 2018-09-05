require_relative '../lib/pair_matrix_builder.rb'

describe 'pair matrix builder class' do
	
	# let	(:names)		{ ["Conor", "Frankie", "Chad"] }
	# let	(:lastnames)	{ ["McGregor", "Edgar", "Mendes"] }
	# let	(:nicknames)	{ ["The Notorious", "The Answer", "Rampage"] }
	# let	(:age_range)	{ (18..40) }
	# let (:player)		{ Player.new } 
		
	# let	(:roster_builder)	{RosterBuilder.new(	names: names.dup, 
	# 											lastnames: lastnames.dup, 
	# 											nicknames: nicknames.dup, 
	# 											age_range: age_range.dup)
	# 						}		

	# let (:roster)			{roster_builder.build(3, player)}
	let (:conor)	{ Enemy.new }
	let (:frankie)	{ Enemy.new }
	let (:chad)		{ Enemy.new }
	let (:player)	{ Player.new }

	context 'when given a roster of size 3 plus a player' do
		let (:roster)		{ [conor, frankie, chad, player] }
		let (:pair_matrix)	{ PairMatrixBuilder.new(roster).build }			
		
		it 'should create 6 pairs' do
			expect(pair_matrix.size).to eq(6)
			pair_matrix.each do |pair|
				expect(pair.size).to eq(2)
			end
		end

		it 'should create an array of sets' do
			expect(pair_matrix.is_a?(Array)).to eq(true)
			pair_matrix.each do |pair|
				expect(pair.is_a?(Set)).to eq(true)
			end
		end

		it 'should not contain any duplicates within a pair' do
			pair_matrix.each do |pair|
				expect(pair.to_a[0] != pair.to_a[1]).to eq(true) 
			end
		end

		it 'should create a pair for each fighter with each other fighter' do 
			roster.each do |fighter|
				roster_minus_fighter = roster.dup - [fighter]
				roster_minus_fighter.each do |f|
					expect(pair_matrix).to include([f,fighter].to_set)
				end
			end
		end
	end
	
end