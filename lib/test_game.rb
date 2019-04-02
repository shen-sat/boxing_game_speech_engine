require_relative 'enemy_builder.rb'
require_relative 'enemy.rb'
require_relative 'pair_matrix_builder.rb'
require_relative 'fight_record_builder.rb'
require_relative 'rules_builder.rb'
require_relative 'trash_talk_processor.rb'
require_relative 'press_conference.rb'
require_relative 'query.rb'
require_relative 'player_creator.rb'
require_relative 'fight_selection.rb'
require_relative 'player.rb'

require 'ap'
require 'set'
require 'roo'

accepted_command_line_args = ['player', 'choose-fight']

#Validate command-line args
command_line_args = ARGV
command_line_args.each do |arg|
  if !(accepted_command_line_args.include?(arg))
    puts "Exiting because argument #{arg} not recognised"
    abort
  end
end

#Create player
player = PlayerCreator.new(command_line_args).create
puts "Player name is #{player.name}, age is #{player.age}, rank is #{player.rank}"

#skipping roster builder and creating enemies and roster myself
joe = EnemyBuilder.new.set_name('Joe').set_age(40).set_lastname('Jaw').set_nickname('Grim').set_rank(0).set_no_of_fights(99).build
kid = EnemyBuilder.new.set_name('Kid').set_age(18).set_lastname('Smith').set_nickname('Quick').set_rank(1).set_no_of_fights(5).build

roster = [player, joe, kid]

#Next, build the pair matrix
pair_matrix_builder = PairMatrixBuilder.new(roster)
pair_matrix = pair_matrix_builder.build

#Then build a fight record
fight_record = FightRecordBuilder.new(pair_matrix).build

#Build rules
file = Roo::Spreadsheet.open('lib/chat.ods')
rules_builder = RulesBuilder.new(file)
rules_builder.order_contents
rules = rules_builder.build

#Build trash talk processor
trash_talk_processor = TrashTalkProcessor.new(rules)

#Choose fighters to fight
fight_selection = FighterSelection.new(command_line_args, roster)
pair_of_fighters = fight_selection.select

#Initiate press conference
press_conference = PressConference.new(pair_of_fighters, fight_record, trash_talk_processor)
press_conference.start