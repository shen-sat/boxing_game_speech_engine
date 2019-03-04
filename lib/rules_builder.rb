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

  def sort_rules_contents
    rules_contents.delete_row(0)
    sorted_rules_contents = []
    rules_contents.each do |row|
      sorted_rules_contents << row
    end
    sorted_rules_contents.sort_by! { |row| row[0].value }.reverse!
    self.rules_contents=sorted_rules_contents
  end

  def build
    sort_rules_contents
    rules_contents.each_with_index do |row, index|
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