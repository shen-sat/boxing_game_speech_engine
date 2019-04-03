class FightRecordEditor
  attr_accessor :fight_record

  def initialize(fight_record)
    @fight_record = fight_record
  end

  def show_menu_pairs
    fight_record.keys.each_with_index do |pair, index|
      puts "[#{index}] #{pair.to_a[0].name} and #{pair.to_a[1].name}"
    end
  end

  def show_menu_pair_fight_record(choice)
    selected_pair = fight_record.keys[choice]
    fight_record[selected_pair].keys.each_with_index do |k, i|
      puts "[#{i}] #{k}: #{fight_record[selected_pair][k].is_a?(Fighter) ? fight_record[selected_pair][k].name : fight_record[selected_pair][k]}"
    end
  end
end