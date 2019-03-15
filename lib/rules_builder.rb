class RulesBuilder
  attr_accessor :sheets, :workbook, :rules, :contents_sheet

  def initialize(file)
    @workbook = file
    @sheets = workbook.sheets
    @rules = {}
    @contents_sheet = workbook.sheet(0)
  end

  def build
    contents_sheet.each do |row|
      score = row[0]
      condition =  row[1]
      go_through_sheets_and_add_rules(score, condition)
    end
    return rules
  end
end

def go_through_sheets_and_add_rules(score, condition)
  rules[[score, condition]] = []
  workbook.each_with_pagename do |name, sheet|
    sheet.each { |line| rules[[score, condition]] << line[0] } if condition == name
  end
end