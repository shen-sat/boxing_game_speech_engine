class Enemy
	attr_accessor :name, :lastname, :nickname, :rank

	def initialize(name:, lastname:, nickname:, rank:)
		@name = name
		@lastname = lastname
		@nickname = nickname
		@rank = rank
	end

end