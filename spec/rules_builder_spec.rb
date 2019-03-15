require 'roo'
require_relative '../lib/rules_builder'

describe 'trash talk processor class' do

  file = Roo::Spreadsheet.open('speech.ods')

  it 'should build a simple rule' do
    rules_builder = RulesBuilder.new(file)
    rules = rules_builder.build
    expect(rules.keys.first).to eq([1, 'opponent_is_older'])
    expect(rules[rules.keys.first][0]).to eq('Your pension awaits')
    expect(rules[rules.keys.first][1]).to eq('Your time is up, old timer')
  end



end