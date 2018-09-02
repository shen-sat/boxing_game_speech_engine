class EnemyBuilder

	def initialize
		@enemy = Enemy.new
	end

	def set_name(name)
		@enemy.name = name
		return self		
	end

	def set_lastname(lastname)
		@enemy.lastname = lastname
		return self
	end

	def set_nickname(nickname)
		@enemy.nickname = nickname
		return self
	end
	
	def set_rank(rank)
		@enemy.rank = rank
		return self
	end

	def set_age(age)
		@enemy.age = age
		return self
	end

	def build
		finished_enemy = @enemy
		@enemy = Enemy.new
		return finished_enemy
	end
end
