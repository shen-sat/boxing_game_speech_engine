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
    first_fighter = roster[first_choice]
    amended_roster = roster - [first_fighter]
    puts "Now select second fighter:"
    amended_roster.each_with_index {|fighter, index| puts "[#{index}] #{fighter.name} '#{fighter.nickname}' #{fighter.lastname}"}
    second_choice = STDIN.gets.chomp.to_i
    second_fighter = amended_roster[second_choice]
    puts "You chose #{first_fighter.name} and #{second_fighter.name}"
    return [first_fighter, second_fighter]
  end
end