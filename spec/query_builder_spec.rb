require_relative '../lib/fight_record_builder.rb'
require_relative '../lib/query_builder.rb'
require_relative '../lib/enemy.rb'
require_relative '../lib/query_builder.rb'
require 'awesome_print'

describe 'Query Builder class' do

	fighter = EnemyBuilder.new	.set_name("Conor")
								.set_lastname("McGregor")
								.set_nickname("The Notorious")
								.set_rank(0)
								.set_age(30)
								.build 

	enemy = EnemyBuilder.new	.set_name("Khabib")
								.set_lastname("Nurg")
								.set_nickname("The Eagle")
								.set_rank(1)
								.set_age(29)
								.build
	extra = EnemyBuilder.new	.set_name("Eddie")
								.set_lastname("Alvarez")
								.set_nickname("Not sure")
								.set_rank(2)
								.set_age(25)
								.build

	roster = [fighter, enemy, extra]
	pair_matrix = PairMatrixBuilder.new(roster).build
	fight_record = FightRecordBuilder.new(pair_matrix).build
	pair = [enemy, fighter].to_set
	fight_record[pair][:last_fight_winner] = enemy


	it 'should build a query' do
		query = QueryBuilder.new.build(fighter, enemy, fight_record)
		expect(query[:fighter].name).to eq("Conor")
		expect(query[:opponent].age).to eq(29)
		expect(query.has_key?(:history)).to eq(true)
		expect(query[:history].has_key?(:last_fight_winner)).to eq(true)
		expect(query[:history][:last_fight_winner]).to eq(enemy)
    expect(query[:history].has_key?(fighter)).to eq(true)
		expect(query[:history].has_key?(enemy)).to eq(true)
		expect(query[:history][fighter].has_key?(:no_of_wins)).to eq(true)
		expect(query[:history][enemy].has_key?(:no_of_wins)).to eq(true)
		expect(query[:history][enemy][:no_of_wins]).to eq(nil)
		expect(query[:history][fighter][:no_of_wins]).to eq(nil)



	end

end