class Game

  attr_accessor :humanplayer, :ennemies

  def initialize(humanplayer)
    @humanplayer = HumanPlayer.new("#{humanplayer}")
    @player_1 = Player.new("Leonardo")
    @player_2 = PLayer.new("Donatello")
    @player_3 = Player.new("Michelangelo")
    @player_4 = PLayer.new("Raphaëlo")
    @player_left = 10
    @enemies_in_sight =[]
    @ennemies = [@player_1, @player_2, @player_3, @player_4]
  end

  def kill_player
    @ennemies.each {
      |player|
        if (player.life_points <= 0)
          @ennemies.delete(player)
          puts "#{player.name} vient d'être éliminé !"
        end
      }
  end

  def is_still_ongoing?
    if @humanplayer.life_points > 0 && (@player_1.life_points > 0 || @player_2.life_points > 0 || @player_3.life_points > 0 || @player_4.life_points > 0)
      return true
    else
      return false
    end
  end

  def show_players
    puts ""
    puts "———————————————————————————————————————————————————"
    puts "•        Il reste #{@ennemies.size} méchant       •"
    puts "———————————————————————————————————————————————————"
    puts ""
  end

  def menu

    command = 1

    puts ""
    puts ""
    puts "a — tu pars à la recherche d'une arme"
    puts "s — tu pars à la recherche d'un pack de soin"
    puts ""
    puts ""
    puts "Si tu veux faire une attaque !"
    puts ""

    @ennemies.each {
      |player|
        puts "#{command} — #{player.name} a #{player.life_points} vie"
      command += 1
    }

  end

  def menu_choice(action)
    if action == "a"
      @humanplayer.search_weapon
    elsif action == "s"
      @humanplayer.search_health_pack
    elsif action == "1"
      @humanplayer.attacks(@player_1)
    elsif action == "2"
      @humanplayer.attacks(@player_2)
    elsif action == "3"
      @humanplayer.attacks(@player_3)
    elsif action == "4"
      @humanplayer.attacks(@player_4)
    else
      puts "Tu as le choix entre a, s, 1, 2, 3 ou 4. Recommence !"
    end
      kill_player
  end

  def enemies_attack

    puts ""
    puts "•             Les ennemies attaquent !            •"
    puts ""

    @ennemies.each {
      |player| player.attacks(@humanplayer)
    }

  end

  def end

    puts ""
    puts ""
    puts "———————————————————————————————————————————————————"
    puts "•                    GAME OVER                    •"
    puts "———————————————————————————————————————————————————"
    puts ""
    puts ""

    puts "Le jeu est fini !"
    ennemies{|ennemi| ennemi.life_points <= 0} (puts "Bravo ! Tu as gagné !") : (puts "Loser ! Tu as perdu !")

  end

end
