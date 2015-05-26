require 'spec_helper'

RSpec.describe Hand do
  it 'should take card' do
    hand = Hand.new
    card = Card.new(suit: :diamonds, rank: "K")
    hand.take_card!(card)
    expect(hand.cards.count).to eq(1)
  end

  it 'should not take nil' do
    hand = Hand.new
    hand.take_card!(nil)
    expect(hand.cards.count).to eq(0)
  end

  it 'should take card from deck' do
    hand = Hand.new
    deck = Deck.new
    hand.take_card_from_deck!(deck)
    expect(hand.cards.count).to eq(1)
  end

  it 'should return value' do
    hand = Hand.new [Card.new(suit: :diamonds, rank: "K"), Card.new(suit: :clubs, rank: "Q")]
    expect(hand.value).to eq(20)
  end

  it 'should split if 2 pic card' do
    hand = Hand.new [Card.new(suit: :diamonds, rank: "K"), Card.new(suit: :clubs, rank: "Q")]
    hands =  hand.split
    expect(hands.count).to eq(2)
  end

  it 'should not split if not 2 pic card' do
    hand = Hand.new [Card.new(suit: :diamonds, rank: "K"), Card.new(suit: :clubs, rank: "5")]
    hands =  hand.split
    expect(hands).to eq(nil)
  end
end