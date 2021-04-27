class Player

  attr_accessor :name, :life_points #la variable d'instance qui permet de lire et de modifier

  def initialize(name) #la methode qui initialise un joueur
    @name = name
    @life_points = 10
  end

  def show_state #la methode qui montre l'état du joueur
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage) #la methode qui stock les points de vie

    @life_points -= damage

    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
    end

  end

  def attacks(other_player) #la methode qui lance une attaque et qui annonce les dégats

    puts "Le joueur #{@name} attaque le joueur #{other_player.name}."
    other_player_damage = compute_damage

    puts "Il lui inflige #{other_player_damage} points de dommages"
    other_player.gets_damage(other_player_damage)

  end

  def compute_damage #la methode qui donne des points de dommage aléatoire
    return rand(1..6)
  end

end

class HumanPlayer < Player #la classe HumanPlayer qui hérite de Player

  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state #la methode qui affiche les informations joueur
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon #la methode pour acquérir une nouvelle arme

    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! Elle est meilleur que ton arme actuelle : tu la prends."
    elsif new_weapon_level <= @weapon_level
      puts "M@*#$..! Elle n'est pas mieux que ton arme actuelle..."
    end

  end

  def search_health_pack #la methode pour acquérir un pack de santé

    health_pack = rand(1..6)

    if health_pack == 1
      puts "Tu n'as rien trouvé !"

      elsif health_pack == 6
        if @life_points >= 20
           @life_points = 100
        else
           @life_points + 80
      end
        puts "Wahouuu, tu as trouvé un pack de +80 points de vie !"

      else
        if @life_points >= 50
           @life_points = 100
        else
           @life_points + 50
        end
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      end
    end

end
