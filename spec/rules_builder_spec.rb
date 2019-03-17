require 'roo'
require_relative '../lib/rules_builder'

describe 'trash talk processor class' do

  simple_file = Roo::Spreadsheet.open('speech_simple.ods')
  # multiple_simple_file = Roo::Spreadsheet.open('speech_simple_multiple.ods')

  it 'should build a simple rule' do
    rules_builder = RulesBuilder.new(simple_file)
    rules = rules_builder.build
    expect(rules.keys.first).to eq([1, 'opponent_is_older'])
    expect(rules[rules.keys.first][0]).to eq('Your pension awaits')
    expect(rules[rules.keys.first][1]).to eq('Your time is up, old timer')
    end

  # it 'should build multiple simple rules' do
  #   rules_builder = RulesBuilder.new(multiple_simple_file)
  #   rules = rules_builder.build
  #   # puts rules
  #   expect(rules.keys.first).to eq([1, 'opponent_is_older'])
  #   expect(rules.keys[1]).to eq([1, 'opponent_is_champ'])
  #
  #   expect(rules[rules.keys.first][0]).to eq('Your pension awaits')
  #   expect(rules[rules.keys.first][1]).to eq('Your time is up, old timer')
  # end



end