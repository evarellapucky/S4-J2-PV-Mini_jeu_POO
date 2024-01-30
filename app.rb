require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'




def fiiiiiight(player1, player2)
  while player1.life_points > 0 && player2.life_points > 0
    puts " "
    puts "________Voici l'état de chaque joueur_________"
    puts " "
    puts player1.show_state
    puts player2.show_state
    puts " "
    puts "_________Passons à la phase d'attaque_________"
    puts " "
    player1.attacks(player2)
  break if player2.life_points <= 0
    puts " "
   player2.attacks(player1)
  end 
end

def perform
  player1 = Player.new("Petite perruche")
  player2 = Player.new("Sorcier en carton")
  puts "----------------------------------------------"
  puts "|__________La guerre est déclaréee___________|"
  fiiiiiight(player1, player2)
end

perform




# binding.pry