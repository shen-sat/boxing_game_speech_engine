require_relative '../lib/roster_builder.rb'
require_relative '../lib/player.rb'
require_relative '../lib/enemy.rb'

describe 'roster builder class' do
	
	let	(:names)		{["Conor", "Frankie", "Chad"]}
	let	(:lastnames)	{["McGregor", "Edgar", "Mendes"]}
	let	(:nicknames)	{["The Notorious", "The Answer", "Rampage"]}
	let	(:age_range)	{(18..40)}
	
	before (:each) do	
		@roster_builder = RosterBuilder.new(names: names.dup, lastnames: lastnames.dup, nicknames: nicknames.dup, age_range: age_range.dup)		
	end

	it 'should create an array of 3 enemies from the input 3' do
		roster = @roster_builder.build(3)
		expect(roster.size).to eq(3)
		expect(names).to include(roster[0].name)
		expect(lastnames).to include(roster[1].lastname)
		expect(nicknames).to include(roster[2].nickname)
		expect(age_range).to include(roster[0].age)	
	end

	it 'should add a player to the end of a roster of enemies' do 
		player = Player.new
		player.name = "Shamrock"
		roster = @roster_builder.build(3)
		roster = @roster_builder.add_player(roster, player)
		expect(roster.last.name).to eq("Shamrock")
	end
end