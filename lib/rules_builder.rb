require 'rubyXL'
require 'ap'

class RulesBuilder
  attr_accessor :rules, :worksheets, :rules_contents, :responses

  def initialize(workbook)
    @rules = {}
    @worksheets = workbook.worksheets
    @rules_contents = worksheets[0]
    @responses = []
  end

  def build
    rules_contents.each_with_index do |row, index|
      next if row == rules_contents.first
      score = row[0].value
      rule = row[1].value
      worksheets.each do |sheet|
        if sheet.sheet_name == rule
          sheet.each do |sheet_row|
            responses << sheet_row[0].value
          end
        end
      end
      rules.merge!([score, rule] => responses)
    end
    rules
  end

end