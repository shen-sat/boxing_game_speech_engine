require_relative 'fighter'

class Enemy < Fighter

  def build_query(opponent, fight_record)
    query = Query.new(self, opponent, fight_record)
    return query
  end

end