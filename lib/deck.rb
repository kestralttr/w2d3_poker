require_relative "card"
require "byebug"
class Deck
  attr_accessor :card_pile

  SUITS = [ :s, :d, :h, :c]
  VALUES = (2..14).to_a

  def self.build_deck
    result = []
    VALUES.each do |value|
      SUITS.each do |suit|
        result << Card.new(suit, value)
      end
    end
    result
  end

  def initialize
    @card_pile = Deck.build_deck.shuffle
  end

  def deal(cards_to_deal)
    hand = []
    cards_to_deal.times do
      hand << @card_pile.shift
    end
    hand
  end

  def receive_cards(array)
    @card_pile.concat(array).shuffle
  end

end
#
# deck = Deck.new
# p deck.card_pile.length
# p deck.deal(5)
# p deck.card_pile.length
