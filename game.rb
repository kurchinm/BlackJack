require_relative 'card'
require_relative 'player'

class Game
  attr_reader :current_card_deck, :current_player, :current_PC, :bank

  def initialize(player, pc)
    @current_player = player
    @current_PC = pc
    @current_card_deck = CardDeck.new
    @current_card_deck.mix

    puts 'Card deck was mixed and is ready now!'
    puts "Your bank is #{@current_player.bank}"
    sleep 1

    @bank = @current_player.bet(10) + @current_PC.bet(10)
  end

  def play
    @current_player.fold_cards
    @current_PC.fold_cards
    deal_cards
    system('clear')
    game_end = false

    until game_end
      show_cards(@current_player)
      puts "player PC has #{@current_PC.cards_num} cards"

      case @current_player.turn
      when 1
        @current_player.take_card(@current_card_deck.pull_card)
        game_end = true if @current_player.cards_num == 3 && @current_PC.cards_num == 3
      when 2
      when 3
        game_end = true
      end

      unless game_end
        case @current_PC.turn
        when 1 then @current_PC.take_card(@current_card_deck.pull_card)
        when 2
        end
      end

      game_end = true if @current_player.cards_num == 3 && @current_PC.cards_num == 3
      system('clear')
    end

    check_result
  end

  def deal_cards
    @current_player.take_card(@current_card_deck.pull_card)
    @current_player.take_card(@current_card_deck.pull_card)
    @current_PC.take_card(@current_card_deck.pull_card)
    @current_PC.take_card(@current_card_deck.pull_card)
  end

  def show_cards(player)
    puts "#{player.player_name} cards:"

    player.cards.each do |card|
      puts "#{card.name}_#{card.suit}"
    end

    puts "#{player.player_name} scores: #{player.scores_calc}"
    sleep 1
  end

  def check_result
    show_cards(@current_player)
    show_cards(@current_PC)

    if @current_player.scores_calc > @current_PC.scores_calc &&
       @current_player.scores_calc <= 21 ||
       @current_player.scores_calc <= 21 && @current_PC.scores_calc > 21

      puts 'You win!'

      @current_player.bank += bank
    elsif @current_player.scores_calc < @current_PC.scores_calc &&
          @current_PC.scores_calc <= 21 ||
          @current_player.scores_calc > 21 && @current_PC.scores_calc <= 21

      puts 'You loose!'

      @current_PC.bank += bank
    elsif @current_player.scores_calc == @current_PC.scores_calc ||
          @current_player.scores_calc > 21 && @current_PC.scores_calc > 21

      puts 'Draw!'

      @current_player.bank += bank / 2
      @current_PC.bank += bank / 2
    end
  end
end
