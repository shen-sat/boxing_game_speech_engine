require_relative '../lib/enemy_builder.rb'

describe 'enemy builder class' do

	it 'should create an enemy with specified attributes' do
		enemy_builder = EnemyBuilder.new
		conor = enemy_builder	.set_name("Conor")
								.set_lastname("McGregor")
								.set_nickname("The Notorious")
								.set_rank(0)
								.set_age(30)
    						.set_no_of_fights(10)
								.build
		expect(conor.name).to eq("Conor")
		expect(conor.lastname).to eq("McGregor")
		expect(conor.nickname).to eq("The Notorious")
		expect(conor.rank).to eq(0)
		expect(conor.age).to eq(30)
		expect(conor.no_of_fights).to eq(10)
	end
	
end