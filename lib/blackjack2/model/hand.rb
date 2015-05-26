class Hand
  extend Forwardable

  attr_reader :cards
  def_delegators :@cards, :count

  def initialize(cards=[])
    @cards = cards
  end

  def value
    aced = 0
    val = @cards.inject(0) do |sum, card|
      sum += card.value
      aced += 1 if card.rank == "A"
    end

    # FIX THIS
    if val > 21 && aced == 1
      val -= 10
    elsif val > 21 && aced > 1
      aced.times { val -= 10 }
    end

    val
  end

  def take_card_from_deck!(deck)
    take_card!(deck.next_card!)
  end

  def split
    @cards.each_slice(1).to_a if @cards.count == 2 && all_value_eq?(@cards)
  end

  def take_card!(card)
    @cards << card if card.instance_of?(Card)
  end

  def all_value_eq?(cards)
    cards.map { |card| card.value }.uniq.count == 1
  end
end
