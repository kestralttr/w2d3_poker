require_relative 'card'

class Hand

  attr_accessor :your_hand

  def initialize(your_hand = [])
    @your_hand = your_hand
  end

  def return_type_of_hand
    case
    when royal_flush?
      return :royal_flush
    when straight_flush?
      return :straight_flush
    when four_of_a_kind?
      return :four_of_a_kind
    when full_house?
      return :full_house
    when flush?
      return :flush
    when straight?
      return :straight
    when three_of_a_kind?
      return :three_of_a_kind
    when two_pair?
      return :two_pair
    when one_pair?
      return :one_pair
    else
      return :high_card
    end
  end

  def royal_flush?
    suit_to_match = @your_hand.first.suit
    @your_hand.each do |card|
      return false if card.suit != suit_to_match
    end

    card_values = @your_hand.map {|card| card.value}
    return card_values.sort == (10..14).to_a
  end

  def straight_flush?
    suit_to_match = @your_hand.first.suit
    @your_hand.each do |card|
      return false if card.suit != suit_to_match
    end

    card_values = @your_hand.map {|card| card.value}
    card_values.sort.each_with_index do |value, idx|
      break if card_values[idx+1] == nil
      return false if value + 1 != card_values[idx+1]
    end
    true
  end

  def straight?
    card_values = @your_hand.map {|card| card.value}
    card_values.sort!.each_with_index do |value, idx|
      break if card_values[idx+1] == nil
      return false if value + 1 != card_values[idx+1]
    end
    true
  end

  def four_of_a_kind?
    card_values = @your_hand.map {|card| card.value}
    card_values.sort!
    if card_values[0..3].uniq.length == 1
      return true
    elsif card_values[1..4].uniq.length == 1
      return true
    else
      false
    end
  end

  def flush?
    suit_to_match = @your_hand.first.suit
    @your_hand.each do |card|
      return false if card.suit != suit_to_match
    end
    true
  end

  def three_of_a_kind?
    card_values = @your_hand.map {|card| card.value}
    card_values.sort!
    if card_values[0..2].uniq.length == 1
      return true
    elsif card_values[2..4].uniq.length == 1
      return true
    else
      false
    end
  end

  def one_pair?
    card_values = @your_hand.map {|card| card.value}
    card_values.sort!

    card_values.each do |value|
      if card_values.count(value) == 2
        return true
      end
    end
    false
  end

  def two_pair?
    card_values = @your_hand.map {|card| card.value}
    card_values.sort!
    pairs = []
    card_values.each do |value|
      if card_values.count(value) == 2
        pairs << value
      end
    end
    return pairs.length == 4
  end

  def full_house?
    card_values = @your_hand.map {|card| card.value}
    card_values.sort!
    if card_values[0..2].uniq.length == 1
      return card_values[-2] == card_values[-1]
    elsif card_values[2..4].uniq.length == 1
      return card_values[0] == card_values[1]
    else
      false
    end
  end

  def give_value_of_hand
    hand_values_arr = [:high_card, :one_pair, :two_pair, :three_of_a_kind,
      :straight, :flush, :full_house, :four_of_a_kind, :straight_flush, :royal_flush]

      hand_values_arr.index(self.return_type_of_hand)
  end


end

# 
# p hand = Hand.new([Card.new(:s,11),Card.new(:s,1),Card.new(:d,1),Card.new(:d,12),Card.new(:c,12)])
# p hand.give_value_of_hand
