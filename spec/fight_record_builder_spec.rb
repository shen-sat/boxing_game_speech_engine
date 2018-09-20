require_relative '../lib/fight_record_builder.rb'
require_relative '../lib/enemy.rb'
require_relative '../lib/player.rb'

describe 'Fight Record Builder class' do

	conor = Enemy.new
	frankie = Enemy.new
	player = Player.new
	let(:pair_matrix)	{ 	[[conor, frankie].to_set, 
							[conor, player].to_set, 
							[frankie, player].to_set] 
						}
	
	let(:fight_record_builder)	{FightRecordBuilder.new(pair_matrix)}
	let(:fight_record)			{fight_record_builder.build}


	it 'should build a hash of with each set of fighters as keys' do
		pair_matrix.each do |pair|
			expect(fight_record.has_key?(pair)).to eq(true)
		end
	end
	
	it 'should be agnostic to the order of fighters when their pair is called' do
		expect(fight_record.has_key?([frankie, player].to_set)).to eq(true)
		expect(fight_record.has_key?([player, frankie].to_set)).to eq(true)
	end

	it 'should build a hash of fight stats for each pair' do 
		expect(fight_record[[conor, player].to_set].has_key?(:last_fight_winner)).to eq(true)
		expect(fight_record[[conor, player].to_set].has_key?(:last_fight_win_method)).to eq(true)
		expect(fight_record[[conor, player].to_set].has_key?(:last_fight_no_of_rounds)).to eq(true)
		expect(fight_record[[conor, player].to_set].has_key?(conor)).to eq(true)
		expect(fight_record[[conor, player].to_set].has_key?(player)).to eq(true)
		expect(fight_record[[conor, player].to_set][conor].has_key?(:no_of_wins)).to eq(true)
		expect(fight_record[[conor, player].to_set][player].has_key?(:no_of_wins)).to eq(true)
	end

end