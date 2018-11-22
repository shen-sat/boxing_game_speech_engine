class TrashTalkProcessor
	attr_accessor :rules

	def initialize(rules)
		@rules = rules
	end


	def response(query)
		rules.each_pair do |key, value|
			outcome = eval "#{key}(query)"

		end 
	end

	def opponent_is_older(query)
	end
end