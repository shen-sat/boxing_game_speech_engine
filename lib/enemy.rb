require_relative 'fighter'

class Enemy < Fighter

  def build_query(opponent, fight_record)
    query = Queries.new(self, opponent, fight_record)
    return query
  end

  def trash_talk(query, trash_talk_processor)
    trash_talk_processor.process(query).split('\n').each {|line| puts line }
  end

end