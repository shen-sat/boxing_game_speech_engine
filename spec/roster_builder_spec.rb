require_relative '../lib/roster_builder.rb'
require_relative '../lib/player.rb'
require_relative '../lib/enemy.rb'

describe 'roster builder class' do
	
	let	(:names)		{ ["Conor", "Frankie", "Chad"] }
	let	(:lastnames)	{ ["McGregor", "Edgar", "Mendes"] }
	let	(:nicknames)	{ ["The Notorious", "The Answer", "Rampage"] }
	let	(:age_range)	{ (18..40) }
	let (:player)		{ Player.new } 
		
	let	(:roster_builder)	{RosterBuilder.new(	names: names.dup, 
												lastnames: lastnames.dup, 
												nicknames: nicknames.dup, 
												age_range: age_range.dup)
							}		


	context 'when given input 3 and a player' do
		let	(:roster)	{ roster_builder.build(3, player) }
		it 'should build a roster of 4 fighters' do
			expect(roster.size).to eq(4)
		end

		it 'should build enemies with the required attributes' do
			expect(names).to include(roster[0].name)
			expect(lastnames).to include(roster[1].lastname)
			expect(nicknames).to include(roster[2].nickname)
			expect(age_range).to include(roster[0].age)
		end
		
		it 'should add the player to the end of the roster' do
			expect(roster.last.is_a?(Player)).to eq(true)	
		end

		it 'should not have an enemy repeated in the roster' do
			duplicates_check = roster.detect {|fighter| roster.count(fighter) > 1 }
			expect(duplicates_check).to eq(nil)
		end

	end

	context 'when initialised with duplicate names' do
		enemy_builder = EnemyBuilder.new
		conor = enemy_builder.set_name("Conor").set_lastname("McGregor").build
		conor_duplicate = enemy_builder.set_name("Conor").set_lastname("McGregor").build
		frankie = enemy_builder.set_name("Frankie").set_lastname("Edgar").build
		enemy_array = [conor, frankie]
		it 'should detect enemies with the same first and last names' do
			expect(roster_builder.duplicate_names?(enemy_array, conor_duplicate)).to eq(true)
		end
	end 

end