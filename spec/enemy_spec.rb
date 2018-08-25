require_relative '../lib/enemy.rb'

describe 'enemy class' do

	it 'should be successfully instantiated with required attributes in any order' do
		conor = Enemy.new(rank: 0, name: "Conor", lastname: "McGregor", nickname: "The Notorious")
		expect(conor.name).to eq("Conor")

	end	
end