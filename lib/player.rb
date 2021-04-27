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

end
