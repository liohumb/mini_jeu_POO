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
  
end
