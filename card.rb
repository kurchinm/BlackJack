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
    when '2' then 2
    when '3' then 3
    when '4' then 4
    when '5' then 5
    when '6' then 6
    when '7' then 7
    when '8' then 8
    when '9' then 9
    when '10', 'Jack', 'Queen', 'King' then 10
    when 'Ace' then total <= 10 ? 11 : 1
    end
  end
end

