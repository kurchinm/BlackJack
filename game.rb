require_relative 'card'
require_relative 'player'

class Game
  attr_accessor :player_name
  attr_reader :current_card_deck, :current_player, :current_PC
  def initialize
    @current_card_deck = CardDeck.new
    @current_card_deck.mix
    puts "Card deck was mixed and is ready now! Input your name..."
    @current_player = PlayerUser.new(gets.chomp)
    @current_PC = PlayerPC.new
  end

  def deal_cards
    @current_player.take_card(@current_card_deck.pull_card)
    @current_player.take_card(@current_card_deck.pull_card)
    @current_player.cards.each do |card|
      puts "#{card.name}_#{card.suit}"
    end
    sleep 5
    @current_PC.take_card(@current_card_deck.pull_card)
    @current_PC.take_card(@current_card_deck.pull_card)
     
  end

  def show_cards
  end
end