require_relative '../lib/trash_talk_processor.rb'
require_relative '../lib/query_builder.rb'

describe 'trash talk processor class' do

	rules = {} 
	rules["opponent_is_older"] = [1, "Young punks always get smashed"]
	rules["opponent_is_younger"] = [1, "Old timers don't belong here"]
	
	context 'when fighter is younger than opponent' do 

		it 'should return young trash talk' do
		query = double(:query)
		allow(query)	.to receive_message_chain(:[], :age)
						.with(:fighter)
						.with(no_args) { 29 }
		allow(query)	.to receive_message_chain(:[], :age)
						.with(:opponent)
						.with(no_args) { 35 }

		# trash_talk_processor = TrashTalkProcessor.new(rules)
		# response = trash_talk_processor.response(query)


					
			

		end
	end
end