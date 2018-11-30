class TrashTalkProcessor
	attr_reader :rules
	
	def initialize(rules)
		@rules = rules
	end

	def process(checks)
		responses = []
		rules.each do |key, value|
			if (eval "checks.#{key[0]}") == true
				responses << rules[key][true]
			else
				responses << rules[key][false]
			end
		end
		return responses[0].sample	
	end

end