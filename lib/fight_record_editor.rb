class FightRecordEditor
  attr_accessor :fight_record

  def initialize(fight_record)
    @fight_record = fight_record
  end

  def show_menu_pairs
    puts 'Which pair do you want to edit?'
    fight_record.keys.each_with_index do |pair, index|
      puts "[#{index}] #{pair.to_a[0].name} and #{pair.to_a[1].name}"
    end
  end

  def show_menu_pair_fight_record(choice)
    puts 'Which record do you want to edit?'
    selected_pair = fight_record.keys[choice]
    fight_record[selected_pair].keys.each_with_index do |k, i|
      puts "[#{i}] #{k}: #{fight_record[selected_pair][k].is_a?(Fighter) ? fight_record[selected_pair][k].name : fight_record[selected_pair][k]}"
    end
  end

  def edit_last_fight_winner(choice)
    selected_pair = fight_record.keys[choice]
    if fight_record[selected_pair][:last_fight_winner] == nil
      puts "There is currently no last fight winner"
    else
      puts "Last fight winner is currently #{fight_record[selected_pair][:last_fight_winner].name}"
    end
    puts "What would you like the value to be?"
    selected_pair.to_a.each_with_index do |fighter, i|
      puts "[#{i}] #{fighter.name}"
    end
    input = STDIN.gets.to_i
    selected_fighter = selected_pair.to_a[input]
    fight_record[selected_pair][:last_fight_winner] = selected_fighter
  end

end