require_relative 'game'
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
    current_game = Game.new
    current_game.deal_cards
  when 2
    #edit_settings
  else
    puts "Error. Press correct button!"
    sleep 2
    system('clear')
  end
end

def edit_settings
  
end
