require_relative 'game'
require_relative 'player'

puts "Hello BlackJack v0.9"
puts "Press 1 to start new game"
puts "Press 2 to edit settings"
puts "Press 0 to exit"
loop do
  status = gets.chomp.to_i
  case status
  when 0
    break
  when 1
    system('clear')
    puts "Input your name..."
    current_player = PlayerUser.new(gets.chomp)
    current_PC = PlayerPC.new
    gaming = 'Y'
    while gaming == 'Y'
      current_game = Game.new(current_player,current_PC)
      current_game.play
      current_game = nil
      puts "Press Y to continue or any else to exit..."
      gaming = gets.chomp
    end
  when 2
    #edit_settings
  else
    puts "Error. Press correct button!"
    sleep 1
    system('clear')
  end
end

def edit_settings
  
end
