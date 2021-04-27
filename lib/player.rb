class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage)

    @life_points -= damage

    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
    end

  end

  def attacks(other_player)

    puts "Le joueur #{@name} attaque le joueur #{other_player.name}."
    other_player_damage = compute_damage

    puts "Il lui inflige #{other_player_damage} points de dommages"
    other_player.gets_damage(other_player_damage)

  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon

    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! Elle est meilleur que ton arme actuelle : tu la prends."
    elsif new_weapon_level <= @weapon_level
      puts "M@*#$..! Elle n'est pas mieux que ton arme actuelle..."
    end

  end

end
