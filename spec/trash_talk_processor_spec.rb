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
	rules = { 	[1, "opponent_won_last"] => 	{	
												true => [	"You got lucky last time", 
															"This won't be a repeat of the last fight"
														], 
												false =>[	"I'll beat you again",
															"I'll beat you faster than the last fight"
														]
												},
				[1, "opponent_is_champ"] =>		{
												true => [ "You don't deserve the throne",
														  "The belt belongs to me"		
														]
												} 
			} 

	it 'should respond to query: the opponent won last match, opp not champ' do
		allow(checks).to receive(:opponent_won_last)	{true}
		allow(checks).to receive(:opponent_is_champ)	{false}
		allow(rules[[1, "opponent_won_last"]][true]).to receive(:sample) {"This won't be a repeat of the last fight"}
		trash_talk_processor = TrashTalkProcessor.new(rules)
		expect(trash_talk_processor.process(checks)).to eq("This won't be a repeat of the last fight")
	end

	it 'should respond to query: the opponent lost last match, opponent not champ' do
		allow(checks).to receive(:opponent_won_last)	{false}
		allow(checks).to receive(:opponent_is_champ)	{false}
		allow(rules[[1, "opponent_won_last"]][false]).to receive(:sample) {"I'll beat you again"}
		trash_talk_processor = TrashTalkProcessor.new(rules)
		expect(trash_talk_processor.process(checks)).to eq("I'll beat you again")
	end

	it 'should respond to either query: the opponent is champ OR the opponent lost last match' do
		allow(checks).to receive(:opponent_won_last)	{false}
		allow(checks).to receive(:opponent_is_champ)	{true}
		allow(rules[[1, "opponent_won_last"]][false]).to receive(:sample) {"I'll beat you again"}
		allow(rules[[1, "opponent_is_champ"]][true]).to receive(:sample) {"You don't deserve the throne"}
		trash_talk_processor = TrashTalkProcessor.new(rules)
		expect(["I'll beat you again", "You don't deserve the throne"]).to include(trash_talk_processor.process(checks))
	end

	it 'should respond to query: opponent being champion AND the opponent losing last match' do
		rules[[2, "opponent_is_champ && opponent_won_last"]] = 	{
																true => [ 	"You're fighting a champ this time",
												  							"Last time I didn't have the belt to defend"		
																		]
																}
		allow(checks).to receive(:opponent_won_last)	{true}
		allow(checks).to receive(:opponent_is_champ)	{true}
		allow(rules[[2, "opponent_is_champ && opponent_won_last"]][true]).to receive(:sample) {"You're fighting a champ this time"}
		trash_talk_processor = TrashTalkProcessor.new(rules)
		expect(trash_talk_processor.process(checks)).to eq("You're fighting a champ this time")

	end

	
end