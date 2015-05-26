class Hand
  extend Forwardable

  attr_reader :cards
  def_delegators :@cards, :count

  def initialize(cards=[])
    @cards = cards
  end

  def value
    aced = 0
    sum = 0

    @cards.each do |card|
      sum  += card.value.to_i
      aced += 1 if card.rank == 'A'
    end

    ((sum -= 10) && (aced -= 1)) while(sum > 21 && aced >= 0)

    sum
  end

  def take_card_from_deck!(deck)
    take_card!(deck.next_card!)
  end

  def split
    return @cards.each_slice(1).to_a.map { |card| Hand.new([card]) } if @cards.count == 2 && all_value_eq?(@cards)
    nil
  end

  def take_card!(card)
    @cards << card if card.instance_of?(Card)
  end

  def all_value_eq?(cards)
    cards.map { |card| card.value }.uniq.count == 1
  end
end
