#Players
class Player
  attr_reader :cards
  def initialize(name = 'PC')
    @player_name = name
    @bank = 100
    @cards = []
    @scores = 0
  end

  def take_card(card)
    @cards << card
  end

  def scores_calc
    aces = []
    self.cards.each do |card|
      if card.name = 'Ace'
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
    return @scores
  end

  def scores_to_zero
    @scores = 0
  end
end

class PlayerPC < Player
end

class PlayerUser < Player
end