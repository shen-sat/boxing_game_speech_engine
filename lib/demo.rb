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
require_relative '../lib/queries'
require_relative '../lib/fight_selector'
require_relative '../lib/fight_record_editor'
require_relative '../lib/reader'

require 'roo'
require 'ap'
require 'terminal-table'

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
if command_line_args.include?("no-player")
  roster = [cobra, joe]
else
  roster = [player, cobra, joe]
end

system "clear"
reader = Reader.new
puts "Say hello to the most fantastic collection of oddballs, rogues and mean-mugs you'll ever meet: your roster :)"
reader.see_roster(roster)
puts "Press enter to continue"
STDIN.gets

pair_matrix = PairMatrixBuilder.new(roster).build
fight_record = FightRecordBuilder.new(pair_matrix).build

loop do
  system "clear"
  puts "Proceed to next press conference or edit fight record?"
  puts "[0] Press conference"
  puts "[1] Fight record"
  if STDIN.gets.chomp.to_i == 1
    system "clear"
    puts "Entering fight record editor"
    fight_record_editor = FightRecordEditor.new(fight_record)
    fight_record_editor.show_menu_pairs
    choice = STDIN.gets.chomp.to_i
    fight_record_editor.edit_last_fight_winner(choice)
  else
    system "clear"
    puts "Entering press conference"
    fight_selector = FightSelector.new(roster)
    selected_fighters = fight_selector.select
    system "clear"
    press_conference = PressConference.new(selected_fighters, fight_record, trash_talk_processor)
    press_conference.start
    puts "See roster table:"
    reader.see_roster(selected_fighters)
    puts "See fight record:"
    reader.see_fight_record(fight_record)
    puts "Press enter to continue"
    STDIN.gets
  end
end












