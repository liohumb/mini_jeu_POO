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

end
