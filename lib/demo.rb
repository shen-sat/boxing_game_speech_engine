require_relative '../lib/player'
require_relative '../lib/rules_builder'
require_relative '../lib/player_creator'
require_relative '../lib/utils'

require 'roo'
require 'ap'

utils = Utils.new

chat_file = Roo::Spreadsheet.open('lib/chat.ods')
rules = RulesBuilder.new(chat_file).build


command_line_args = ARGV
utils.validate_args(command_line_args)




player = PlayerCreator.new(command_line_args).create

puts "*** #{player.name} '#{player.nickname}' #{player.lastname}, age: #{player.age} rank: #{player.rank} fights: #{player.no_of_fights}"








