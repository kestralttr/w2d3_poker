require "hand"
require 'card'

describe Hand do
  subject(:royal_flush) {Hand.new([Card.new(:s,10),Card.new(:s,11),Card.new(:s,12),Card.new(:s,13),Card.new(:s,14)])}
  subject(:straight_flush) {Hand.new([Card.new(:s,10),Card.new(:s,11),Card.new(:s,12),Card.new(:s,13),Card.new(:s,14)])}
  subject(:flush) {Hand.new([Card.new(:s,10),Card.new(:s,11),Card.new(:s,12),Card.new(:s,13),Card.new(:s,14)])}
  subject(:four_of_a_kind) {Hand.new([Card.new(:s,10),Card.new(:s,10),Card.new(:s,10),Card.new(:s,10),Card.new(:s,14)])}

  describe "\#royal_flush?" do
    it "identifies royal_flushes" do
      expect(royal_flush.royal_flush?).to be(true)
    end
  end

  describe "\#straight_flush?" do
    it "identifies straight flushes" do
      expect(straight_flush.straight_flush?).to be(true)
    end
  end

  describe "\#flush?" do
    it "identifies flushes" do
      expect(flush.flush?).to be(true)
    end
  end

  describe "\#four_of_a_kind?" do
    it "identifies four of a kind" do
      expect(four_of_a_kind.four_of_a_kind?).to be(true)
    end
  end

end
