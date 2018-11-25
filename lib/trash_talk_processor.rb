class TrashTalkProcessor
	attr_accessor :rules, :query

	def initialize(rules)
		@rules = rules
	end


	def response(query)
		@query = query
		responses_and_scores = []
		rules.each_pair do |key, value| 
			outcome = eval "#{key}"
			if outcome == true
				responses_and_scores << value
			end
		end
		sorted_responses_and_scores = responses_and_scores.sort_by { |chat| chat.values.first }.reverse
		return sorted_responses_and_scores[0].keys.first 
	end

	def opponent_is_older
		if @query[:fighter].age < @query[:opponent].age
			return true
		else
			return false
		end
	end

	def opponent_is_younger
		if @query[:fighter].age > @query[:opponent].age
			return true
		else
			return false
		end
	end

	def fighter_is_champ
		@query[:fighter].rank == 0
	end

	def fighter_won_last_matchup
		fighter = @query[:fighter]
		opponent = @query[:opponent]
		pair = [fighter, opponent].to_set
		@query[:fight_record][pair][:last_fight_winner] == fighter
	end
end