#cards need to be able to carry str, cost, name and 
#two powers

class Card
	attr_accessor :name
	attr_accessor :str 
	attr_accessor :cost
	
	def initialize()
		@name = name
		@str = str
		@cost = cost
	end 

	def power_1()
		@power1_name = power1_name
	end 

	def power_2()
		@power2_name = power2_name
	end 
end 


class ClarkTheRed < Card

	def initialize()
		@name = "Clark the Red"
		@str = 6
		@cost = 5
	end 

end 

class LukeTheChampion < Card

	def initialize()
		@name = "Luke the Champion"
		@str = 3
		@cost = 4 
	end 
end 

class BadDog < Card

	def initialize()
		@name = "Bad Dog"
		@str = 1
		@cost = 5
	end 
end 

class JMan < Card

	def initialize()
		@name = "J Man"
		@str = 3
		@cost = 4
	end 
end 

class Lester < Card

	def initialize()
		@name = "Lester"
		@str = 1
		@cost = 4
	end 
end 

class GavRav < Card

	def initialize()
		@name = "GavRav"
		@str = 3
		@cost = 3
	end
end 

class NatetheGreat < Card

	def initialize()
		@name = "Nate the Great"
		@str = 3
		@cost = 5
	end 
end 

class Drex < Card

	def initialize()
		@name = "DRex"
		@str = 3
		@cost = 5
	end 
end 

class Paleface < Card

	def initialize()
		@name = "Paleface"
		@str = 3
		@cost = 4
	end 
end 

class Hook < Card

	def initialize()
		@name = "Hook"
		@str = 3
		@cost = 4
	end 
end 
