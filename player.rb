class Player
  attr_reader :cards, :player_name
  attr_accessor :bank

  def initialize(name = 'PC')
    @player_name = name
    @bank = 100
    @cards = []
    @scores = 0
  end

  def take_card(card)
    @cards << card
  end

  def fold_cards
    @cards = []
  end

  def cards_num
    @cards.size
  end

  def scores_calc
    scores_to_zero
    aces = []

    cards.each do |card|
      if card.name == 'Ace'
        aces << card
        next
      end

      @scores += card.score
    end

    if aces.size != 0
      aces.each do |card|
        @scores += card.score(@scores)
      end
    end

    @scores
  end

  def scores_to_zero
    @scores = 0
  end

  def bet(sum)
    @bank -= sum if @bank >= sum
    sum
  end
end

class PlayerPC < Player
  def turn
    decision = scores_calc < 17 ? 1 : 2
  end
end

class PlayerUser < Player
  def turn
    puts "Your turn! Your scores #{scores_calc}. Press 1 to take card, 2 to wait, 3 to open cards."
    decision = gets.chomp.to_i
  end
end

