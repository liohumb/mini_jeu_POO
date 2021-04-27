class Game

  attr_accessor :human_player, :enemies

  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    @enemies = [Player.new("Leonardo"), Player.new("Donatello"), Player.new("Michelangelo"), Player.new("Raphaëlo")]
  end

  def kill_player
    @enemies.each do |dead_player|
      if dead_player.life_points <= 0
        @enemies.delete(dead_player)
      end
    end
  end

  def is_still_gongoring?
    if @human_player.life_points > 0 && !@enemies.empty?
      return true
    else
      return false
    end
  end

end
