class RulesBuilder
  attr_accessor :sheets, :workbook

  def initialize(file)
    @workbook = file
    @sheets = workbook.sheets
  end

  def build
    rules = {}
    contents_sheet = workbook.sheet(0)
    contents_sheet.each do |row|
      score = row[0]
      condition =  row[1]
      workbook.each_with_pagename do |name, sheet|
        temp_array = []
        if condition == name
          sheet.each do |line|
            temp_array << line[0]
          end
          rules[[score, condition]] = temp_array
          temp_array = []
        end
      end
    end
    return rules
  end
end