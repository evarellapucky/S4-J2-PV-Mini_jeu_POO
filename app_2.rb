require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

  puts "----------------------------------------------------"
  puts "|        Bienvenue sur ton nouveau jeu             |"
  puts "|                ton but ultime :                  |"
  puts "| survivre pour devenir le maîtres des croquettes  |"
  puts "----------------------------------------------------"

  
  puts "Quel est ton nom, conquérant de la croquette ?"
  print ">"
  player_name = gets.chomp
  player = HumanPlayer.new(player_name)
  enemy1 = Player.new("le Boucher")
  enemy2 = Player.new("Lilith")
  enemies = [enemy1, enemy2]


  while player.life_points > 0 && (enemy1.life_points > 0 || enemy2.life_points > 0)
    sleep(2)
    puts " "
    puts player.show_state
    sleep(2)
    puts " "
    puts "Qu'est-ce que tu veux faire ?"
    puts "a - chercher une arme"
    puts "b - chercher des PV"
    puts "attaquer un joueur en vue"
    puts "0 - #{enemy1.name} a #{[0, enemy1.life_points].max} PV"
    puts "1 - #{enemy2.name} a #{[0, enemy2.life_points].max} PV"
    action = gets.chomp
    sleep(2)
    puts " "
      case action
      when "a"
        player.search_weapon
        puts " "
      when "b"
        player.search_health_pack
        puts " "
      when "0"
        player.attacks(enemy1)
        puts " "
      when "1" 
        player.attacks(enemy2)
        puts " "
      else
        puts "On t'a dit : a, b, 0 ou 1 ... c'est pas compliqué quand-même !"  
      end 
      puts " "
      sleep(1)
    
    enemies.each do |enemy|
      if enemy.life_points > 0
        puts "les ennemis t'attaquent ! (mais t'es pas sensé mourir)"
        enemy.attacks(player)
      end
    end 
  end  


  puts "La partie est finie"
  puts "Bravo, tu es devenu le maître des croquettes" if player.life_points > 0 || enemy1.life_points < 0 && enemy2.life_points < 0
  puts "Nooooooon, tu as perdu toutes tes croquettes ... retente ta chance" if player.life_points < 0 || enemy1.life_points > 0 && enemy2.life_points > 0