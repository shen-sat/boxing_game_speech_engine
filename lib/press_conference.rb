class PressConference
  attr_reader :fighters, :fight_record, :trash_talk_processor

  def initialize(fighters, fight_record, trash_talk_processor)
    @fighters = fighters
    @fight_record = fight_record
    @trash_talk_processor = trash_talk_processor
  end

  def give_mic(fighter, opponent)
    puts "#{fighter.name} '#{fighter.nickname}' #{fighter.lastname} says:"
    query = fighter.build_query(opponent, fight_record)
    fighter.trash_talk(query, trash_talk_processor)
    puts "----------------------------------"
  end

  def start
    fighters.each do |fighter|
      opp_as_array = fighters.select {|f| f != fighter}
      opponent = opp_as_array[0]
      give_mic(fighter, opponent)
    end
  end

end