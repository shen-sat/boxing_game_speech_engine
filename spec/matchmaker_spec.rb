require_relative '../lib/matchmaker.rb'

describe 'Matchmaker class' do

	let(:daniel)	{ double("daniel") }
	let(:jon)		{ double("jon") }
	let(:alex) 		{ double("alex") } 
	let(:roster)	{ [ daniel, jon, alex ] }



	it 'should pick two random fighters from a roster' do
		matchmaker = Matchmaker.new(roster)
		allow(roster).to receive(:delete_at).and_return(jon, alex)


		
		matchmaker.pick_two_fighters
		# allow(roster).to receive(:sample)	{ false }
		# roster.should_receive(:sample).ordered.and_return { jon }
		# roster.should_receive(:sample).ordered.and_return { alex }
		# expect([jon, alex]).to eq(matchmaker.pick_two_fighters)
		# allow(jones).to receive(:rank)	{ 1 }
		# allow(alex).to receive(:rank)	{ 2 }


	end
	
end