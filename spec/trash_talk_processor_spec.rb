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
	rules = { "opponent_is_older" => ["Make way for the next generation!", 1] }

	it 'should return the most relevant line for younger fighter' do
		allow(checks).to receive(:opponent_is_older)	{true}
		trash_talk_processor = TrashTalkProcessor.new(rules)
		expect(trash_talk_processor.process(checks)).to eq("Make way for the next generation!")
	end
	
end