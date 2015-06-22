require "./card.rb"

class Combat
	attr_accessor :card1
	attr_accessor :card2

	def initialize(card1, card2)
		@card1 = card1
		@card2 = card2
	end 

	def first_turn(card1, card2)
		start = rand(1..2)
		if start == 1
			first = card1
			return first
		else
			first = card2
			return first
		end 
		return first
	end 

	def attack(first)
