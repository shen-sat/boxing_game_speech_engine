require_relative '../lib/checks.rb'

describe 'checks class' do

	let(:holly)	{ double("holly") }
	let(:ronda) { double("ronda") }
	let(:query)	{ { :fighter => holly,
					:opponent => ronda,
					:history => {
								:last_fight_winner => holly		
								} 
				} }
	

	it 'should initialise with query and create fighter, opponent, fight record and pair attributes' do
		checks = Checks.new(query)
		expect(checks.fighter).to eq(holly)
		expect(checks.opponent).to eq(ronda)
		expect(checks.history).to eq(query[:history])
	end

	it 'should check for older opponent' do
		allow(holly).to receive(:age) { 37 }
		allow(ronda).to receive(:age) { 31 }

		checks = Checks.new(query)
		expect(checks.opponent_is_older).to eq(false)
	end

	it 'should check last fight winner was fighter' do
		checks = Checks.new(query)
		expect(checks.opponent_won_last_fight).to eq(false)
	end
	
end