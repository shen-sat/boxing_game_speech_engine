class RulesBuilder
  attr_accessor :sheets, :workbook

  def initialize(file)
    @workbook = file
    @sheets = workbook.sheets
  end

  def build
    contents_sheet = workbook.sheet(0)
    contents_sheet.each do |row|
      score = row[0]
      rule =  row[1]
      workbook.each_with_pagename do |name, sheet|
        if rule == name
          puts 'Matching rule!'
        end
      end
    end
  end

end