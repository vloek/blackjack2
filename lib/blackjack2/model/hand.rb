class Hand
  extend Forwardable

  attr_reader :cards
  def_delegators :@cards, :count

  def initialize(cards=[])
    @cards = cards
  end

  def value
    @cards.inject(0) { |sum, card| sum += card.value }
  end

  def take_card_from_deck!(deck)
    take_card!(deck.next_card!)
  end

  def split
    @cards.each_slice(1).to_a
  end

  def take_card!(card)
    @cards << card if card.instance_of?(Card)
  end
end
