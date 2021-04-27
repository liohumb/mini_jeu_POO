class Game

  attr_accessor :human_player, :enemies

  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    @enemies = [Player.new("Leonardo"), Player.new("Donatello"), Player.new("Michelangelo"), Player.new("Raphaëlo")]
  end

end
