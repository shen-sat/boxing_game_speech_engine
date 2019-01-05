require_relative '../lib/matchmaker.rb'

describe 'Matchmaker class' do

	let(:daniel)	{ double("daniel") }
	let(:jon)		{ double("jon") }
	let(:alex) 		{ double("alex") } 
	let(:roster)	{ [ daniel, jon, alex ] }



	it 'should pick two random fighters from a roster' do
		matchmaker = Matchmaker.new(roster)
		allow(roster).to receive(:delete_at).and_return(jon, alex)
		expect([jon, alex]).to eq(matchmaker.pick_two_fighters)
	end
	
end