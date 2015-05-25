class Diller
  extend Forwardable
  attr_reader :hand

  MAX_NUM = 17

  def_delegators :@hand, :take_card!, :take_card_from_deck!, :count, :cards, :value

  def initialize
  end

  def command(command)
    command.execute
  end

  def take_hand!(hand)
    @hand = hand
  end

  def first_card
    cards.first
  end

  def flush!
    @hand = Hand.new
  end

  def take_to_self_from!(deck)
    take_card_from_deck!(deck) while value < MAX_NUM
  end
end


@diller = Diller.new
@p = Player.new(1000, diller)
@p.bet!(100)
@p.deal!
@diller.value
@p.current_hand.value
@p.hit!
@p.current_hand.value
@p.stand!
@p.bet!(100)
@p.deal!
