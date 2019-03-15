class RulesBuilder
  attr_accessor :sheets, :workbook, :rules

  def initialize(file)
    @workbook = file
    @sheets = workbook.sheets
    @rules = {}
  end

  def build
    contents_sheet = workbook.sheet(0)
    contents_sheet.each do |row|
      score = row[0]
      condition =  row[1]
      rules[[score, condition]] = []
      workbook.each_with_pagename do |name, sheet|
        sheet.each { |line| rules[[score, condition]] << line[0] } if condition == name
      end
    end
    return rules
  end
end