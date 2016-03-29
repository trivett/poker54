def to_cards(str)
  # Takes a string and returns an array of cards.
  str.split.map { |c| Card.new(c) }
end
