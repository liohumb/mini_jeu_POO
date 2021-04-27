require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts ""
puts "———————————————————————————————————————————————————"
puts "•    Bienvenue sur 'ILS VEULENT TOUS MA POO' !    •"
puts "• Le but du jeu est d'être le dernier survivant ! •"
puts "———————————————————————————————————————————————————"
puts ""

puts "Choisi ton pseudo :"
print "• "
user_name = gets.chomp

puts ""
puts ""

user = HumanPlayer.new(user_name)

players_arr = [player1 = Player.new("Josiane"), player2 = Player.new("José")]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

  puts ""
  puts ""

  puts "OK ! #{user_name}, ton état est :"
  puts user.show_state
  puts "Je te montre aussi les états des méchants :"
  puts player1.show_state
  puts player2.show_state

  puts ""

  puts "Est que tu veux une arme ? Un pack de soin ?"
  puts ""
  puts "a — tu pars à la recherche d'une arme"
  puts "s — tu pars à la recherche d'un pack de soin"

  puts ""
  puts ""

  puts "Si tu veux faire une attaque !"

  puts ""

  if player1.life_points > 0
    print "0 — "
    player1.show_state
  end
  if player2.life_points > 0
    print "1 — "
    player2.show_state
  end

  puts ""
  puts ""

  puts "Fait ton choix :"
  print "• "
  action = gets.chomp

  puts ""
  puts ""

  if action == "a"
    user.search_weapon
  end

  if action == "s"
    user.search_health_pack
  end

  if action == "0" && player1.life_points > 0
    user.attacks(player1)
  end

  if action == "1" && player2.life_points > 0
    user.attacks(player2)
  end

  puts ""
  puts ""
  puts ""

  if player1.life_points > 0 && player2.life_points > 0
    puts "Les autres joueurs t'attaquent !"
  end

  players_arr.each do |enemy|
    if enemy.life_points > 0
       enemy.attacks(user)
    end

  end

end
