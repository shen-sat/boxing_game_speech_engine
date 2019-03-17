class RulesBuilder
  attr_accessor :workbook, :rules, :contents_sheet

  def initialize(file)
    @workbook = file
    @rules = {}
    @contents_sheet = workbook.sheet(0)
  end

  def build
    puts "hello"
    workbook.sheet(0).parse.each do |row|
      puts "this is a row #{row}"
      puts "hey"
    end
    return rules
  end


end