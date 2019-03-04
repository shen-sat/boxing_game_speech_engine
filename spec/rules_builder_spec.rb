require_relative '../lib/rules_builder.rb'

describe 'rules builder class' do

  workbook_simple = RubyXL::Parser.parse("dummy-rules.xlsx")
  workbook_complex = RubyXL::Parser.parse("dummy-rules-v2.xlsx")

  it 'should build a simple rule' do

    rules_builder = RulesBuilder.new(workbook_simple)
    rules = rules_builder.build
    expect(rules.keys.first[0]).to eq(1)
    expect(rules.keys.first[1]).to eq("opponent_is_older")
    expect(rules[rules.keys.first][0]).to eq("Your time is up, old timer")
    expect(rules[rules.keys.first][1]).to eq("Senior citizens don't belong in the ring")
  end

  it 'should order the rules with highest scored first' do
    rules_builder = RulesBuilder.new(workbook_complex)
    rules = rules_builder.build
    expect(rules.keys.first[0]).to eq(2)

    #TODO add new rule to spreadsheet, then build method for ordering, then build and check for first rule
  end




end