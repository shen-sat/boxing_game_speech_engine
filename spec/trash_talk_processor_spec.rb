require_relative '../lib/trash_talk_processor.rb'
require_relative '../lib/query_builder.rb'

describe 'trash talk processor class' do

	opponent_is_older = ["opponent_is_older"]
	opponent_is_younger = ["opponent_is_younger"]
	rules = {} 
	rules["opponent_is_older"] = { "Old timers don't belong here" => 1 }
	rules["opponent_is_younger"] = { "Young punks always get smashed" => 1 }
	
	
	let(:yair)	{ double(:yair) }
	let(:edgar) { double(:edgar) }
	let(:query)	{ Hash.new }

	before(:each) do
		allow(yair).to receive(:age)	{29}
		allow(edgar).to receive(:age)	{35}
	end

	context 'when fighter is younger than opponent' do 

		it 'should return young trash talk' do
			query[:fighter] = yair
			query[:opponent] = edgar
			trash_talk_processor = TrashTalkProcessor.new(rules)
			response = trash_talk_processor.response(query)
			expect(response).to eq("Old timers don't belong here")
		end
	end

	context 'when fighter is older than opponent' do 

		it 'should return old trash talk' do
			query[:fighter] = edgar
			query[:opponent] = yair
			trash_talk_processor = TrashTalkProcessor.new(rules)
			response = trash_talk_processor.response(query)
			expect(response).to eq("Young punks always get smashed")
		end
	end

	context 'when fighter is older than opponent and fighter is champ and old-champ trash talk is avaialble' do 

		it 'should return the higher-scored old-champ trash talk' do
			allow(edgar).to receive(:rank) {0}
			rules["opponent_is_younger && fighter_is_champ"] = { "Young punks can't claim the throne" => 2 }
			
			query[:fighter] = edgar
			query[:opponent] = yair
			trash_talk_processor = TrashTalkProcessor.new(rules)
			response = trash_talk_processor.response(query)
			expect(response).to eq("Young punks can't claim the throne")
		end
	end

	context 'when fighter is not younger than opponent and fighter is champ and old-champ trash talk is avaialble' do 

		it 'should return the higher-scored old-champ trash talk' do
			allow(edgar).to receive(:rank) {0}
			rules["!opponent_is_older && fighter_is_champ"] = { "Young punks can't claim the throne" => 2 }
			
			query[:fighter] = edgar
			query[:opponent] = yair
			trash_talk_processor = TrashTalkProcessor.new(rules)
			response = trash_talk_processor.response(query)
			expect(response).to eq("Young punks can't claim the throne")
		end
	end

	context 'when fighter is champ or they won the last fight and cocky trash talk is available' do 

		it 'should return the higher-scored old-champ trash talk' do
			allow(edgar).to receive(:rank) {3}
			rules["fighter_is_champ || fighter_won_last_matchup"] = { "I feel unbeatable!" => 1 }
			query[:fighter] = edgar
			query[:opponent] = yair
			pair = [yair, edgar].to_set
			query[:fight_record] = {}
			query[:fight_record][pair] = {}
			query[:fight_record][pair][:last_fight_winner] = edgar
			trash_talk_processor = TrashTalkProcessor.new(rules)
			response = trash_talk_processor.response(query)
			expect(response).to eq("I feel unbeatable!")
		end
	end

end