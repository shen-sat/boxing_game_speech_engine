require_relative '../lib/roster_builder.rb'

describe 'roster builder class' do
	
	it 'should create an array of 3 enemies from the input 3' do
		names = ["Conor", "Frankie", "Chad"]
		lastnames = ["McGregor", "Edgar", "Mendes"]
		nicknames = ["The Notorious", "The Answer", "Rampage"]
		age_range = (18..40)
		number_of_enemies = 3
		roster_builder = RosterBuilder.new(names: names.dup, lastnames: lastnames.dup, nicknames: nicknames.dup, age_range: age_range.dup)
		roster = roster_builder.build(number_of_enemies)
		expect(roster.size).to eq(3)
		expect(names).to include(roster[0].name)
		expect(lastnames).to include(roster[1].lastname)
		expect(nicknames).to include(roster[2].nickname)
		expect(18 <= roster[0].age && roster[0].age <= 40).to eq(true)	
	end
end