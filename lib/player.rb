require_relative "hand"
class Player

  attr_accessor :pot, :hand

  def initialize(pot,hand=Hand.new)
    @pot = pot
    @hand = hand
  end

  def get_cards_to_discard
    puts "Enter up to 3 card indices to discard, starting with 0, separated by a space, or enter
    none to keep all."
    input = gets.chomp
    if input != 0.to_s
      input.split(" ").map {|num| num.to_i}
    else
      -1
    end
  end

  def discard_cards(cards_to_discard)
    cards_to_discard.each do |card_idx|
      @hand.your_hand[card_idx] = nil
    end
    @hand.your_hand.delete_if { |card| card.nil? }
  end

  def return_cards(cards_to_discard)
    result = []
    if cards_to_discard.is_a?(Array)
      cards_to_discard.each do |card_idx|
        result << @hand.your_hand[card_idx]
      end
    end
    discard_cards(cards_to_discard)
    result
  end
end

#
hand = Hand.new([Card.new(:s,2),Card.new(:s,3),Card.new(:d,4),Card.new(:d,5),Card.new(:c,6)])
p hand.return_cards
puts 
