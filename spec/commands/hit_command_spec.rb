require 'spec_helper'

RSpec.describe HitCommand do
  it 'should take card to hand' do
    hand = Hand.new
    deck = Deck.new
    HitCommand.new(hand, deck).execute
    expect(hand.count).to eq(1)
  end
end