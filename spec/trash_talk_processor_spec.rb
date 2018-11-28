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
	rules = { ["opponent_won_last", 1] => 	[	[	"You got lucky last time", 
													"This won't be a repeat of the last fight"
												], 
												[	"I'll beat you again",
													"I'll beat you faster than the last fight"
												]
											]
			  # "!opponent_won_last" => ["I'll beat you again", 1]
			  # "fighter_is_champ" => ["This belt belongs to me", 1]
	 		} 

	it 'should correctly respond to the opponent winning the last match' do
		allow(checks).to receive(:opponent_won_last)	{true}
		allow(rules[["opponent_won_last", 1]][0]).to receive(:sample) {"This won't be a repeat of the last fight"}
		trash_talk_processor = TrashTalkProcessor.new(rules)
		expect(trash_talk_processor.process(checks)).to eq("This won't be a repeat of the last fight")
	end

	it 'should correctly respond to the opponent losing the last match' do
		allow(checks).to receive(:opponent_won_last)	{false}
		allow(rules[["opponent_won_last", 1]][1]).to receive(:sample) {"I'll beat you again"}
		trash_talk_processor = TrashTalkProcessor.new(rules)
		expect(trash_talk_processor.process(checks)).to eq("I'll beat you again")
	end
	
end