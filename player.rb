#Players
class Player
  attr_reader :cards, :player_name
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
    self.scores_to_zero
    aces = []
    self.cards.each do |card|
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
    return @scores
  end

  def scores_to_zero
    @scores = 0
  end

  def bet(sum)
    @bank -= sum if @bank >= sum
    return sum
  end
end

class PlayerPC < Player
  def turn
    if self.scores_calc < 17
      decision = 1
    else
      decision = 2
    end
  end
end

class PlayerUser < Player
  def turn
    puts "Your turn! Your scores #{self.scores_calc}. Press 1 to take card, 2 to wait, 3 to open cards."
    decision = gets.chomp.to_i
  end
end