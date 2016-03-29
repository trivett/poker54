# Hands have player attributes, 
# The player gets to keep the glory of victory, not the ephemeral hand.
class Player
  attr_accessor :wins, :name

  def initialize(name)
    @wins = 0
    @name = name
  end

  def win
    @wins += 1
  end

  def to_s
    "#{name} has won #{wins} time(s)"
  end
end
