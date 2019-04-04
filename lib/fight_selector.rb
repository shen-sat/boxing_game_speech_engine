class FightSelector
  attr_accessor :roster

  def initialize(roster)
    @roster = roster
  end

  def select
    puts "Who do you want to select?"
    puts "First fighter:"
    roster.each_with_index {|fighter, index| puts "[#{index}] #{fighter.name} '#{fighter.nickname}' #{fighter.lastname}"}
    first_choice = STDIN.gets.chomp.to_i
    first_fighter = roster.delete(roster[first_choice])
    puts "Now select second fighter:"
    roster.each_with_index {|fighter, index| puts "[#{index}] #{fighter.name} '#{fighter.nickname}' #{fighter.lastname}"}

  end
end