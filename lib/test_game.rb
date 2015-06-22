#players start with 3 friendship nukes and 2 champions
#and hand of 7 cards remove from deck

#rounds begin
#set-up: random first attack decided
#4 funds (leave room for card funds)
#draw 2 cards from deck add to hand
#remove from deck
#take turns buying cards and placing on table
#funds need to remain consistent until supremecy
#remove funds and cards from hand when played

#battle:
#get battle type from attacker
#hold until end of battle to determine result
#kneel mans (must remain until end of battle)
#sum strength (leave room for powers, dice, etc)
#defender pays consequence if loss
#allow for remaining 2 kinds of battle
#rotate attackers

#clean-up:
#add strength of standing mans, funds
# winner adds card to hand

#things to allow for in later development: powers, 
#buildings
#surprises
#bitching out
# drop a nuke 

require "./lib/player.rb"
require "./lib/battle_board.rb"
player1_fn = 3
player2_fn = 3

player1 = Player.new
player2 = Player.new

player1.player_deck.shuffle()
player2.player_deck.shuffle()

7.times do player1.add_to_hand() 
end 
7.times do player2.add_to_hand()
end 






