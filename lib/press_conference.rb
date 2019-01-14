class PressConference
  attr_reader :fighters, :fight_record, :trash_talk_processor

  def initialize(fighters, fight_record, trash_talk_processor)
    @fighters = fighters
    @fight_record = fight_record
    @trash_talk_processor = trash_talk_processor
  end

  def give_mic(fighter, opponent)
    query = fighter.build_query(opponent, fight_record)
    fighter.trash_talk(query, trash_talk_processor)
  end

end