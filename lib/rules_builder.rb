class RulesBuilder
  attr_accessor :workbook, :rules, :contents

  def initialize(file)
    @workbook = file
    @rules = {}
    @contents = workbook.sheet(0).to_a
  end


  def build
    order_contents
    contents.each do |rule|
      score = rule[0]
      condition = rule[1]
      rules[[score, condition]] = add_responses(condition)
    end
    return rules
  end

  def order_contents
    contents.sort_by! {|rule| rule[0]}.reverse!
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