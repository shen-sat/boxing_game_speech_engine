require 'roo'
require_relative '../lib/rules_builder'

describe 'trash talk processor class' do

  simple_file = Roo::Spreadsheet.open('simple_chat.ods')
  multiple_simple_file = Roo::Spreadsheet.open('multiple_simple_chat.ods')

  it 'should build a simple rule' do
    rules_builder = RulesBuilder.new(simple_file)
    rules = rules_builder.build
    expect(rules.keys.first).to eq([1, 'opponent_is_old'])
    expect(rules[rules.keys.first][0]).to eq('Your time is up, old timer')
    expect(rules[rules.keys.first][1]).to eq('Time to trade those gloves for a pension')
  end

  it 'should build multiple simple rules' do
    rules_builder = RulesBuilder.new(multiple_simple_file)
    rules = rules_builder.build
    expect(rules.keys.first).to eq([1, 'opponent_is_old'])
    expect(rules.keys[1]).to eq([1, 'opponent_is_champ'])
    expect(rules[rules.keys.first][0]).to eq('Your time is up, old timer')
    expect(rules[rules.keys.first][1]).to eq('Time to trade those gloves for a pension')
    expect(rules[rules.keys[1]][0]).to eq('Thanks for keeping my throne warm')
    expect(rules[rules.keys[1]][1]).to eq('That crown belongs to me')
  end
  




end