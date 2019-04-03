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
end