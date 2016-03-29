Dir[File.expand_path 'lib/**/*.rb'].each { |f| require_relative(f) }

alice = Player.new('Alice')
bob = Player.new('Bob')

File.open('./hands.txt').each_line do |game|
  all_cards = to_cards(game)
  alice_hand = Hand.new(alice, all_cards[0..4])
  bob_hand = Hand.new(bob, all_cards[5..9])
  winner = Game.winner(alice_hand, bob_hand)
  winner.win
end

puts alice
puts bob
