require_relative 'enemy_builder.rb'
require_relative 'enemy.rb'
require_relative 'pair_matrix_builder.rb'
require_relative 'fight_record_builder.rb'
require_relative 'rules_builder.rb'
require_relative 'trash_talk_processor.rb'
require_relative 'press_conference.rb'
require_relative 'query.rb'
require_relative 'player_creator.rb'

require 'ap'
require 'set'
require 'roo'

accepted_command_line_args = ['player']

#Validate command-line args
command_line_args = ARGV
command_line_args.each do |arg|
  if !(accepted_command_line_args.include?(arg))
    puts "Exiting because argument #{arg} not recognised"
    abort
  end
end

player = PlayerCreator.new(command_line_args).create

#skipping roster builder and creating enemies and roster myself
joe = EnemyBuilder.new.set_name('Joe').set_age(40).set_lastname('Jaw').set_nickname('Glass').set_rank(10).build
kid = EnemyBuilder.new.set_name('Kid').set_age(18).set_lastname('Smith').set_nickname('Quick').set_rank(2).build

roster = [joe, kid]

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

#Initiate press conference
press_conference = PressConference.new(roster, fight_record, trash_talk_processor)
press_conference.start





