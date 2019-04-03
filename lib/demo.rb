require_relative '../lib/player'
require_relative '../lib/rules_builder'
require_relative '../lib/player_creator'
require_relative '../lib/utils'
require_relative '../lib/enemy_builder'
require_relative '../lib/roster_builder'
require_relative '../lib/pair_matrix_builder'
require_relative '../lib/enemy_builder'
require_relative '../lib/enemy'
require_relative '../lib/fight_record_builder'

require 'roo'
require 'ap'

utils = Utils.new

chat_file = Roo::Spreadsheet.open('lib/chat.ods')
rules = RulesBuilder.new(chat_file).build


command_line_args = ARGV
utils.validate_args(command_line_args)

joe = EnemyBuilder.new.set_name('Joe').set_lastname('Jaw').set_nickname('Glass').set_age(40).set_rank(0).set_no_of_fights(30).build
cobra = EnemyBuilder.new.set_name('Cobra').set_lastname('Kai').set_nickname('Mean-muggin').set_age(20).set_rank(1).set_no_of_fights(10).build

player = PlayerCreator.new(command_line_args).create
puts "*** #{player.name} '#{player.nickname}' #{player.lastname}, age: #{player.age} rank: #{player.rank} fights: #{player.no_of_fights}"

roster = [player, joe, cobra]

pair_matrix = PairMatrixBuilder.new(roster).build
fight_record = FightRecordBuilder.new(pair_matrix).build
# pj = [player, joe].to_set
# jc = [joe, cobra].to_set
# pc = [player, cobra].to_set

#TODO create a fight selector class that accepts args and if args not present, returns the only enemies as a default
# puts "Who should fight?"
# roster.each_with_index {|fighter, index| puts "[#{index}] #{fighter.name}"}
# gets.chomp










