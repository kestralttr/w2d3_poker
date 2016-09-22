require "deck"

describe Deck do
  subject(:deck) {Deck.new}
  let(:unshuffled_cards) {Deck.build_deck}
  # let(:hand) {deck.deal(5)}
  # result = {}

  it "has 52 cards in the card_pile" do
    expect(deck.card_pile.length).to eq(52)
  end

  it "cards are shuffled" do
    expect(deck.card_pile).to_not eq(unshuffled_cards)
  end

  it "deals number of cards requested" do
    hand = deck.deal(5)
    expect(hand.length).to eq(5)
  end

  it "receives card back into card_pile" do
    hand = deck.deal(5)
    deck.receive_cards(hand)
    expect(deck.card_pile.length).to eq(52)
  end

end
