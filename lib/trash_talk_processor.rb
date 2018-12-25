class TrashTalkProcessor
	attr_reader :rules
	
	def initialize(rules)
		@rules = order_rules_by_score(rules)
	end

	def order_rules_by_score(rules)
		ordered_rules = rules.sort_by { |key| key }.to_h.to_a.reverse.to_h
		return ordered_rules

	end

	def process(checks)
		responses = []
		score_check = 0
		rules.each do |key, value|
			break if key[0] < score_check
			eval_key = key[1].split(" ").each { |word| word.insert(0, "checks.") unless word.include?("&") }.join(" ")
			if (eval eval_key) == true
				responses << rules[key][true]
				score_check = key[0]
			else
				responses << rules[key][false] unless !(rules[key].has_key?(false))
				score_check = key[0] unless !(rules[key].has_key?(false))
			end
		end 
		if responses.size == 1
			return responses[0].sample
		else
			return responses.sample.sample
		end		
	end

end