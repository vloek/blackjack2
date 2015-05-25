class Deck
  extend Forwardable

  def_delegators :@cards, :count


  RANKS  = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SCORES = %w(2 3 4 5 6 7 8 9 10 10 10 10 11)
  SUITS  = [:spades, :clubs, :hearts, :diamonds]

  def initialize
    @cards = fill.shuffle
  end

  def next_card!
    @cards.pop
  end

  private

  def fill
    SUITS.flat_map do |suit|
      cards_for_suit(suit)
    end
  end

  def cards_for_suit(suit)
    RANKS.each_with_index.map do |rank, i|
      Card.new(suit: suit, rank: rank, score: SCORES[i] )
    end
  end

end
