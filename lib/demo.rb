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
require_relative '../lib/trash_talk_processor'
require_relative '../lib/press_conference'
require_relative '../lib/query'
require_relative '../lib/fight_selector'

require 'roo'
require 'ap'

utils = Utils.new

chat_file = Roo::Spreadsheet.open('lib/chat.ods')
rules = RulesBuilder.new(chat_file).build

trash_talk_processor = TrashTalkProcessor.new(rules)


command_line_args = ARGV
utils.validate_args(command_line_args)

joe = EnemyBuilder.new.set_name('Joe').set_lastname('Jaw').set_nickname('Glass').set_age(40).set_rank(0).set_no_of_fights(30).build
cobra = EnemyBuilder.new.set_name('Cobra').set_lastname('Kai').set_nickname('Mean-muggin').set_age(22).set_rank(1).set_no_of_fights(10).build

player = PlayerCreator.new(command_line_args).create
puts "*** #{player.name} '#{player.nickname}' #{player.lastname}, age: #{player.age} rank: #{player.rank} fights: #{player.no_of_fights}"

roster = []
if command_line_args.include?("player")
  roster = [player, joe, cobra]
else
  roster = [joe, cobra]
end

pair_matrix = PairMatrixBuilder.new(roster).build
fight_record = FightRecordBuilder.new(pair_matrix).build

fight_selector = FightSelector.new(roster)
selected_fighters = fight_selector.select

press_conference = PressConference.new(selected_fighters, fight_record, trash_talk_processor)
press_conference.start











