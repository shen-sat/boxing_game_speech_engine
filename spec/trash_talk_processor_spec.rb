require_relative '../lib/trash_talk_processor.rb'
require_relative '../lib/query_builder.rb'

describe 'trash talk processor class' do

	rules = {} 
	rules["opponent_is_older"] = "Old timers don't belong here"
	rules["opponent_is_younger"] = "Young punks always get smashed"
	
	context 'when fighter is younger than opponent' do 

		it 'should return young trash talk' do
		query = double()
		allow(query)	.to receive_message_chain(:[], :age)
						.with(:fighter)
						.with(no_args) { 29 }
		allow(query)	.to receive_message_chain(:[], :age)
						.with(:opponent)
						.with(no_args) { 35 }

		trash_talk_processor = TrashTalkProcessor.new(rules)
		response = trash_talk_processor.response(query)
		expect(response).to eq("Old timers don't belong here")


					
			

		end
	end
end