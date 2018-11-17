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

	pair = [fighter, enemy].to_set
	pair_matrix = [pair]
	fight_record = FightRecordBuilder.new(pair_matrix).build
	fight_record[pair][:last_fight_winner] = enemy


	it 'should build a query' do
		query = QueryBuilder.new(fighter, enemy, fight_record).build
		expect(query[:fighter].name).to eq("Conor")
		expect(query[:enemy].age).to eq(29)
		expect(query.has_key?(:fight_record)).to eq(true)
		expect(query[:fight_record].has_key?(pair)).to eq(true)
		expect(query[:fight_record][pair].has_key?(:last_fight_winner)).to eq(true)
		expect(query[:fight_record][pair][:last_fight_winner]).to eq(enemy)
	end

end