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

  

end
