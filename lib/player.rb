class Player 
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    return puts "#{name} a #{life_points} points de vie"
  end
  # permet de montrer l'état des joueurs à un instant T

  def attacks(player)
    puts "#{name} attaque #{player.name}"
    damage_number = compute_damage
    player.gets_damage(damage_number)
    puts "il lui inflige #{damage_number} points de dommages"
    player.you_die
  end
# appelle la méthode gets_damage + compute damage pour le nb de dégâts reçus
  
  def gets_damage(damage)
    @life_points = @life_points - damage
      
  end

  def you_die
    puts "#{name} a été tué" if @life_points <= 0    
  end
# séparation de la méthode gets_damage et you_die pour éviter l'affichage de la mort du joueur avant le nb de dgâts reçus

  def compute_damage
    return rand(1..6)
  end 

end



class HumanPlayer < Player 
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100 
    @weapon_level = 1 
  end

  def show_state 
    return "#{@name} a #{life_points} PV et une arme de lvl #{@weapon_level}"
  end 

  def compute_damage 
    rand(1..6) * @weapon_level 
  end 

  def search_weapon 
    weapon_found = rand(1..6)
    puts "Tu as trouvé une arme de lvl #{weapon_found}"
      if weapon_found > @weapon_level
        @weapon_level = weapon_found 
        puts "Youhou ! Cette arme est bien meilleure que ton baton pourri, tu la prends !"
      else puts "Stuff de la chouette, tu laisses traîner ça par terre"
      end
  end

  def search_health_pack
    health_pack = rand(1..6)
      case health_pack
      when 1
        puts "Tu n'as rien trouvé"
      when 2..5
        @life_points += 50
        @life_points = 100 if @life_points += 50
        puts "Tu as trouvé 50 PV, ne les perds pas tous d'un coup"
        puts "Tu as #{@life_points} PV"
      when 6
        @life_points += 80
        @life_points = 100 if @life_points += 80
        puts " Tu as trouvé 80 PV, tu roxx du poney !!"
        puts "Tu as #{@life_points} PV"
      end
  end




end