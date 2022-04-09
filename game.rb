require_relative 'card'
require_relative 'player'

class Game
  attr_reader :current_card_deck, :current_player, :current_PC
  def initialize(player, pc)
    @current_player = player
    @current_PC = pc
    @current_card_deck = CardDeck.new
    @current_card_deck.mix
    puts "Card deck was mixed and is ready now!"
    @current_player.bet(10)
    @current_PC.bet(10)
  end

  def start
    @current_player.scores_to_zero
    @current_PC.scores_to_zero
    self.deal_cards
    @current_player.turn
  end

  def deal_cards
    @current_player.take_card(@current_card_deck.pull_card)
    @current_player.take_card(@current_card_deck.pull_card)
    @current_player.cards.each do |card|
      puts "#{card.name}_#{card.suit}"
    end
    puts @current_player.scores_calc
    sleep 1
    @current_PC.take_card(@current_card_deck.pull_card)
    @current_PC.take_card(@current_card_deck.pull_card)
    @current_PC.cards.each do |card|
      puts "#{card.name}_#{card.suit}"
    end
    puts @current_PC.scores_calc
    sleep 1
  end

  def show_cards
  end

end