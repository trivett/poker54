# When instantiating Card objects, trump cards are given numeric values.
# Cards are comparable by value only.
class Card
  attr_accessor :value, :suit
  include Comparable

  HIGH_CARD_VALUES = {
    'T' => 10,
    'J' => 11,
    'Q' => 12,
    'K' => 13,
    'A' => 14
  }.freeze

  def initialize(text)
    @value = HIGH_CARD_VALUES[text[0]] || text[0].to_i
    @suit = text[1]
  end

  def <=>(other)
    value <=> other.value
  end
end
