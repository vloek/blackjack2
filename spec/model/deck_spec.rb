require 'spec_helper'

RSpec.describe Deck do
  it 'should 52 cards after initialize' do
    expect(Deck.new.count).to eq(52)
  end

  it 'should have next card' do
    expect(Deck.new.next_card!.class).to eq(Card)
  end
end