class FighterSelection
  attr_reader :command_line_args, :roster

  def initialize(command_line_args, roster)
    @command_line_args = command_line_args
    @roster = roster
  end

  def select
    pair_of_fighters = []
    if command_line_args.include?('choose-fight')
      first_fighter_selection = nil
      second_fighter_selection = nil
      loop do
        puts "Who should fight? Pick FIRST fighter:"
        roster.each do |fighter|
          puts "[#{roster.index(fighter)}] #{fighter.name}"
        end
        first_fighter_selection = STDIN.gets.chomp.to_i
        first_fighter_selection < roster.size ? break : puts("Please pick a given number")
      end
      first_fighter = roster[first_fighter_selection]
      roster.delete(first_fighter)
      loop do
        puts "Now pick SECOND fighter:"
        roster.each do |fighter|
          puts "[#{roster.index(fighter)}] #{fighter.name}"
        end
        second_fighter_selection = STDIN.gets.chomp.to_i
        second_fighter_selection < roster.size ? break : puts("Please pick a given number")
      end
      second_fighter = roster[second_fighter_selection]
      pair_of_fighters = [first_fighter, second_fighter]
      return pair_of_fighters
    else
      roster.delete(player)
      first_fighter = roster.delete(roster.sample)
      second_fighter = roster.delete(roster.sample)
      pair_of_fighters = [first_fighter, second_fighter]
      return pair_of_fighters
    end
  end
end