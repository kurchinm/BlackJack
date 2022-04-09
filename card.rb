class CardDeck
  attr_reader :card_list

  def initialize
    @card_list = []
    card_names = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    card_suits = %w[Clubs Diamonds Hearts Spades]
    card_names.each do |name|
      card_suits.each do |suit|
        @card_list << Card.new(name, suit)
      end
    end
  end

  def mix
    @card_list.sort_by! { rand }
  end

  def pull_card
    @card_list.pop
  end
end

class Card
  attr_reader :name, :suit

  def initialize(name, suit)
    @name = name
    @suit = suit
  end

  def score(total = 0)
    case name
    when '2'
      2
    when '3'
      3
    when '4'
      4
    when '5'
      5
    when '6'
      6
    when '7'
      7
    when '8'
      8
    when '9'
      9
    when '10'
      10
    when 'Jack', 'Queen', 'King'
      10
    when 'Ace'
      if total <= 10
        11
      else
        1
      end
    end
  end
end
