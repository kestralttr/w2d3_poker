require "card"

describe Card do
  let(:suit) {:spade}
  let(:value) {6}
  subject(:card) {Card.new(suit, value)}

  it "has a suit" do
    expect(card.suit).to eq(:spade)
  end

  it "has a value" do
    expect(card.value).to eq(6)
  end


end
