#player is friendship nuke count and decision maker
require "./lib/deck.rb"

class Player

	
	attr_accessor :player_deck
	attr_accessor :player_hand

	def initialize()
		
		@player_deck = Deck.new
		@player_hand = []
		@active_cards = []
	end 

	def add_to_hand()
		@player_hand << @player_deck.deck.shift
	end 

	def display_hand()
		@player_hand.each {|card|
			puts "Name: #{card.name}, Str: #{card.str}, Cost: #{card.cost}"}
	end 

end 

class Board

	attr_accessor :player1_active
	attr_accessor :player2_active
	attr_accessor :player1_done
	attr_accessor :player2_done
	attr_accessor :player1_knelt
	attr_accessor :player2_knelt
	attr_accessor :display_knelt

	def initialize(player1, player2)
		@player1_active = []
		@player2_active = []
		@player1_knelt = []
		@player2_knelt = []
		@player1 = player1
		@player2 = player2
		@player1_done = 0
		@player2_done = 0 
	end

	def display_active(player)
		if player == "player1"
			@player1_active.each {|card|
					puts card.name}
		elsif player == "player2"
			@player2_active.each {|card|
					puts card.name}
		end 
	end 

	def display_knelt(player)
		if player == "player1"
			@player1_knelt.each {|card|
				puts card.name}
		elsif player == "player2"
			@player2_knelt.each {|card|
				puts card.name}
		end 
	end 

	def player1_kneel()
		puts " "
		puts "Player 1, pick a man to kneel:"
		puts " "
		display_active("player1")
		puts " "
		puts "ALREADY KNELT MANS:"
		display_knelt("player1")		
		flag = 1
		while flag == 1
			puts " "
			puts "> "
			kneeled = $stdin.gets.chomp
			@player1_active.each {|card|
				if card.name == kneeled
					@player1_knelt << card
					puts " "
					puts "#{card.name} is in the battle."
					puts " "
					flag = 0
					return flag
					break
				elsif kneeled == "DONE"
					@player1_done = 1
					return @player1_done
				elsif card.name != kneeled
					
					flag = 1					
				end} 
		end 
	end 

	def player2_kneel()
		puts " "
		puts "Player 2, pick a man to kneel:"
		puts " "
		display_active("player2")
		puts " "
		puts "ALREADY KNELT MANS:"
		display_knelt("player2")		
		flag = 1
		while flag == 1
			puts " "
			puts "> "
			kneeled = $stdin.gets.chomp
			@player2_active.each {|card|
				if card.name == kneeled
					@player2_knelt << card
					puts " "
					puts "#{card.name} is in the battle."
					puts " "
					flag = 0
					return flag
					break
				elsif kneeled == "DONE"
					@player2_done = 1
					return @player2_done
				elsif card.name != kneeled
					
					flag = 1					
				end} 
		end 
	end 

	def clear_table()
		@player1_knelt.clear
		@player2_knelt.clear
		@player1_done = 0
		@player2_done = 0
		return @player1_done, @player2_done
	end 
end 

class Purchase

	attr_accessor :player_1_funds
	attr_accessor :player_2_funds
	attr_accessor :player1_done
	attr_accessor :player2_done

	def initialize(player1_active, player2_active, player1, player2)
		@player_1_funds = 10
		@player_2_funds = 10
		@player1_active = player1_active
		@player2_active = player2_active
		@player1 = player1
		@player2 = player2
		@player1_done = 0
		@player2_done = 0
	end 

	def player1purchase()
		puts " "
		puts "Player 1 purchasing round:"
		puts " "
		@player1.display_hand()
		puts " "
		puts "FUNDS: #{@player_1_funds}"	
		puts " "
		flag = 1
		while flag == 1
			puts "Player1, purchase a card from your hand. Type DONE to finish."
			puts "> "
			purchase = $stdin.gets.chomp
			
			@player1.player_hand.each {|card| 
				if card.name == purchase && card.cost <= @player_1_funds
					@player1_active << card
					@player_1_funds -= card.cost
					@player1.player_hand.delete(card)
					puts " "
					puts "#{purchase} added to Player 1 board."
					puts " "
					flag = 0 
					return flag					
				elsif card.name == purchase && card.cost >= @player_1_funds
					puts "You are too poor."
					flag = 1
				elsif purchase == "DONE"
					@player1_done = 1
					return @player1_done
						
				end}		
			
		end
	end 

	def player2purchase()
		puts " "
		puts "Player 2 purchasing round:"
		puts " "
		@player2.display_hand()		
		puts " "
		puts "FUNDS: #{@player_2_funds}"
		puts " "
		flag = 1
		while flag == 1
			puts "Player2, purchase a card from your hand. Type DONE to finish."
			puts "> "
			purchase = $stdin.gets.chomp
			
			@player2.player_hand.each {|card| 
				if card.name == purchase && card.cost <= @player_2_funds
					@player2_active << card
					@player_2_funds -= card.cost
					@player2.player_hand.delete(card)
					puts " "
					puts "#{purchase} added to Player 2 board."
					puts " "
					flag = 0 
					return flag					
				elsif card.name == purchase && card.cost >= @player_2_funds
					puts "You are too poor."
					flag = 1
				elsif purchase == "DONE"
					@player2_done = 1
					return @player2_done
						
				end}		
			
		end
	end 
end 

class Battle

	attr_accessor :winner
	attr_accessor :deadman

	def initialize(player1_knelt, player2_knelt)
		@player_1_sum = [0]
		@player_2_sum = [0]
		@player1_knelt = player1_knelt
		@player2_knelt = player2_knelt
		@winner = winner
		@deadman = deadman
		#@aggro = aggro
		#@type = type
		# DEAL WITH THESE NEXT
	end 

	def get_mans()
		puts "Player 1: select man to kneel"
		puts "> "
		man = $stdin.gets.chomp
	end 

	def battle()
		
		@player1_knelt.each {|card| @player_1_sum << card.str}
		player1_score = @player_1_sum.inject(:+)
		
		@player2_knelt.each {|card| @player_2_sum << card.str}
		player2_score = @player_2_sum.inject(:+)

		if player1_score > player2_score
			puts "player1"
			@winner = "player1"
			return @winner
		elsif player1_score < player2_score 
			puts "player2"
			@winner = "player2"
			return @winner
		elsif player1_score == player2_score
			puts "tie"
			@winner = "nobody"
			return @winner
		end 
	end 

	def get_reward_DM(aggro)	
		if aggro == "player1"
			puts "Player 2, you have lost. Choose a man to destroy:"
			puts " "
			@player2_knelt.each {|card| puts card.name}
			puts " "
			puts "> "
			@deadman = $stdin.gets.chomp
			return @deadman				
			
		elsif aggro == "player2"
			puts "Player 1, you have lost. Choose a man to destroy:"
			puts " "
			@player1_knelt.each {|card| puts card.name}
			
			puts " "
			puts "> "
			@deadman = $stdin.gets.chomp
			return @deadman				
		end 
	end 
	# HAVE TYPE OF BATTLE PASSED IN AS ARGUMENT BASED ON USER INPUT IN MAIN 	
end 





$player1_fn = 3
$player2_fn = 3

player1 = Player.new
player2 = Player.new

player1.player_deck.shuffle()
player2.player_deck.shuffle()

7.times do player1.add_to_hand() 
end 
7.times do player2.add_to_hand()
end 

board = Board.new(player1, player2)




2.times do player1.add_to_hand()
end
2.times do player2.add_to_hand()
end

purchase = Purchase.new(board.player1_active, board.player2_active, player1, player2)
start = rand(1..2)
while purchase.player1_done != 1 or purchase.player2_done != 1
	if start == 1
		purchase.player1purchase()
		purchase.player2purchase()
	elsif start == 2
		purchase.player2purchase()
		purchase.player1purchase()
	end
end 


def get_aggro()
	start = rand(1..2)
	if start == 1
		aggro = "player1"
		return aggro
	elsif start == 2 
		aggro = "player2"
		return aggro
	end 
end 

def get_type(aggro)

	if aggro == "player1"
		puts "Player 1, choose battle type: DM, AR, SW"
		puts "> "
		type = $stdin.gets.chomp
		return type
	elsif aggro == "player2"
		puts "Player 2, choose battle type: DM, AR, SW"
		puts "> "
		type = $stdin.gets.chomp
		return type
	end 
end

aggro = get_aggro()
type = get_type(aggro)

battle = Battle.new(board.player1_knelt, board.player2_knelt)


while board.player1_done != 1 or board.player1_done !=1 
	if start == 1
		board.player1_kneel()
		board.player2_kneel()
	elsif start == 2
		board.player2_kneel()
		board.player1_kneel()
	end 
end 

battle.battle()
flag = 1 
while flag == 1
	if battle.winner == aggro
		battle.get_reward_DM(aggro)		
			if aggro == "player1"
				board.player2_knelt.each {|card|
						if card.name == battle.deadman
							board.player2_active.delete(card)
							flag = 0
							
						elsif card.name != battle.deadman
							puts "You gotta choose someone."
							flag = 1
						end}
				

			elsif aggro == "player2"
				board.player2_knelt.each {|card|
						if card.name == battle.deadman
							board.player2_active.delete(card)
							flag = 0	
												
						elsif card.name != battle.deadman
							puts "You gotta choose someone."
							flag = 1
						end}
				
			end 
		
	else 
		puts "Defender wins nothing."
	end 
end


puts " "
board.display_active("player1")
puts " "
board.display_active("player2")

board.clear_table()


#make knelt cards temporarily leave active cards
