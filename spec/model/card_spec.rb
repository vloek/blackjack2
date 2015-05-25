require 'spec_helper'

RSpec.describe Card do
  it 'should accept suit and rank when build' do
    card = Card.new(suit: :diamonds, rank: "10")
    expect(card.suit).to  eq(:diamonds)
    expect(card.rank).to  eq("10")
  end

  it 'should pic_card value equals to 10' do
    pic_cards = ['J', 'Q', 'K'].map { |n| Card.new(suit: :diamonds, rank: n) }
    pic_cards.each { |card| expect(card.value).to eq(10) }
  end

  it 'should repond_to value' do
    expect(Card.new(suit: :clubs, rank: 'A')).to respond_to(:value)
  end

  it 'A card value should be 11' do
    expect(Card.new(suit: :clubs, rank: 'A').value).to eq(11)
  end
end