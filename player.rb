#Players
class Player
  attr_reader :cards, :scores
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
  end
end

class PlayerUser < Player
  def turn
    puts "Your turn! Your scores #{self.scores}. Press 1 to take card, 2 to wait, 3 to open cards."
    decision = gets.chomp
  end
end