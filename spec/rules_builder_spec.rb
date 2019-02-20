require_relative '../lib/rules_builder.rb'

describe 'rules builder class' do

  workbook = RubyXL::Parser.parse("dummy-rules.xlsx")

  let	(:workbook)		{ RubyXL::Parser.parse("dummy-rules.xlsx") }

  it 'should build a simple rule' do
    rules_builder = RulesBuilder.new(workbook)
    rules = rules_builder.build
    expect(rules.keys.first[0]).to eq(1)
  end




end