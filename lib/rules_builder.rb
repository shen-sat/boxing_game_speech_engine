class RulesBuilder
  attr_accessor :workbook, :rules, :contents_sheet

  def initialize(file)
    @workbook = file
    @rules = {}
    @contents_sheet = workbook.sheet(0)
  end

  def build
    workbook.sheet(0).to_a.each do |row|
      score = row[0]
      condition = row[1]
      responses = []
      puts "this is a score #{score}"
      puts "this is a condition #{condition}"
      workbook.each_with_pagename do |name, sheet|
        if name == condition
          sheet.to_a.each do |line|
            responses << line[0]
          end
        end
      end
      rules[[score, condition]] = responses
    end
    return rules
  end


end