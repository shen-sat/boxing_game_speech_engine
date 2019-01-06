require_relative 'fighter'

class Enemy < Fighter

  def build_query(opponent, fight_record)
    query = Query.new(self, opponent, fight_record)
    return query
  end

  def trash_talk(query, trash_talk_processor)
    return trash_talk_processor.process(query)
  end

end