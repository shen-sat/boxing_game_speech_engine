require_relative 'enemy_builder.rb'
require_relative 'enemy.rb'
require_relative 'pair_matrix_builder.rb'
require_relative 'fight_record_builder.rb'
require_relative 'rules_builder.rb'
require_relative 'trash_talk_processor.rb'
require_relative 'press_conference.rb'
require_relative 'query.rb'

require 'ap'
require 'set'
require 'roo'

#skipping roster builder and creating enemies and roster myself
frankie = EnemyBuilder.new.set_name('Frankie').set_age('35').set_lastname('Edgar').set_nickname('The Answer').set_rank('5').build
brian = EnemyBuilder.new.set_name('Brian').set_age('29').set_lastname('Ortega').set_nickname('T-City').set_rank('2').build

roster = [frankie, brian]

#Next, build the pair matrix
pair_matrix_builder = PairMatrixBuilder.new(roster)
pair_matrix = pair_matrix_builder.build

#Then build a fight record
fight_record = FightRecordBuilder.new(pair_matrix).build

#initialize the trash-talk processor
file = Roo::Spreadsheet.open('lib/chat.ods')
rules_builder = RulesBuilder.new(file)
rules_builder.order_contents
rules = rules_builder.build

trash_talk_processor = TrashTalkProcessor.new(rules)

press_conference = PressConference.new(roster, fight_record, trash_talk_processor)
press_conference.start





