#deck needs to contain same cards in random order
require "./lib/card.rb"

class Deck

	attr_accessor :deck 
	attr_accessor :new_card

	def initialize()
		clark_the_red = ClarkTheRed.new
		luke_the_champion = LukeTheChampion.new
		bad_dog = BadDog.new
		jman = JMan.new
		lester = Lester.new
		gavrav = GavRav.new
		gavrav2 = GavRav.new
		nate_the_great = NatetheGreat.new
		drex = Drex.new
		paleface = Paleface.new
		hook = Hook.new
		
		@deck = [clark_the_red, gavrav, luke_the_champion,
			bad_dog, jman, lester, gavrav2, nate_the_great, drex,
			paleface, hook]
	end 

	def shuffle()
		@deck.shuffle!
	end 

	def new_card()
		@deck.shift
	end 

end 