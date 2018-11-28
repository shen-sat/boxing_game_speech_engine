class TrashTalkProcessor
	attr_reader :rules
	
	def initialize(rules)
		@rules = rules
	end

	def process(checks)
		responses = []
		rules.each do |key, value|
			puts eval "checks.#{key}"
			if (eval "checks.#{key}") == true
				responses << value
			end
		end
		return responses[0][0]
	end

end