class RulesBuilder
  attr_accessor :workbook, :rules, :contents_sheet

  def initialize(file)
    @workbook = file
    @rules = {}
    @contents_sheet = workbook.sheet(0)
  end

  def build
    contents_sheet.to_a.each do |rule|
      score = rule[0]
      condition = rule[1]
      rules[[score, condition]] = add_responses(condition)
    end
    return rules
  end

  def add_responses(condition)
    responses = []
    workbook.each_with_pagename do |name, sheet|
      if name == condition
        sheet.to_a.each do |line|
          responses << line[0]
        end
      end
    end
    return responses
  end


end