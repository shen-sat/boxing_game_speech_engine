require_relative '../lib/fight_record_builder.rb'
require_relative '../lib/enemy.rb'
require_relative '../lib/player.rb'
require_relative '../lib/reader.rb'
require 'terminal-table'

describe 'Fight Record Builder class' do

	conor = EnemyBuilder.new.set_name("Conor").set_lastname("Mcgregor").set_nickname("The Notorious").build
	frankie = EnemyBuilder.new.set_name("Frankie").set_lastname("Edgar").set_nickname("The Answer").build
	chad = EnemyBuilder.new.set_name("Chad").set_lastname("Mendes").set_nickname("Money").build
	let(:pair_matrix)	{ 	[[conor, frankie].to_set, 
							[conor, chad].to_set, 
							[frankie, chad].to_set] 
						}
	
	let(:fight_record_builder)	{FightRecordBuilder.new(pair_matrix)}
	let(:fight_record)			{fight_record_builder.build}

	it 'should build a table with each pair in a a row'  do
		reader = Reader.new
		reader.see_fight_record(fight_record)
	end



end	











