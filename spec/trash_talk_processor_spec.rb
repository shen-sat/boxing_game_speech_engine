require_relative '../lib/trash_talk_processor.rb'

describe 'trash talk processor class' do

	# let(:holly)	{ double("holly") }
	# let(:ronda) { double("ronda") }
	# let(:query)	{ { :fighter => holly,
	# 				:opponent => ronda,
	# 				:history => {
	# 							:last_fight_winner => holly		
	# 							} 
	# 			} }
	
	let(:checks)	{ double("checks") }
	rules = { "opponent_won_last" => ["You got lucky last time", 1]
			  # "fighter_is_champ" => ["This belt belongs to me", 1]
	 		} 

	it 'should return the most relevant line aimed at the champion' do
		allow(checks).to receive(:opponent_won_last)	{true}
		trash_talk_processor = TrashTalkProcessor.new(rules)
		expect(trash_talk_processor.process(checks)).to eq("You got lucky last time")
	end

	# it 'should return the most relevant line aimed at a contender' do
	# 	allow(checks).to receive(:fighter_is_champ)	{true}
	# 	trash_talk_processor = TrashTalkProcessor.new(rules)
	# 	expect(trash_talk_processor.process(checks)).to eq("This belt belongs to me")
	# end
	
end