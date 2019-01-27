require 'rubyXL'
require 'ap'

rules = {}

workbook = RubyXL::Parser.parse("dummy-rules.xlsx")

worksheets = workbook.worksheets

rules_contents = worksheets[0]

responses = []

rules_contents.each_with_index do |row, index|
	next if row == rules_contents.first
	rule = row[1].value
	score = row[0].value
	worksheets.each do |sheet|
		if sheet.sheet_name == rule
			sheet.each do |sheet_row|
				responses << sheet_row[0].value
			end
		end
	end
end

ap responses




