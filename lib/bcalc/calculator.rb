module Bcalc
  class Calculator
    SUITS = {
      "C" => Bcalc::Lib::BCALC_SUIT_CLUBS,
      "D" => Bcalc::Lib::BCALC_SUIT_DIAMONDS,
      "H" => Bcalc::Lib::BCALC_SUIT_HEARTS,
      "S" => Bcalc::Lib::BCALC_SUIT_SPADES,
      "NT" => Bcalc::Lib::BCALC_NT
    }
    PLAYERS = {
      "N" => Bcalc::Lib::BCALC_PLAYER_NORTH,
      "E" => Bcalc::Lib::BCALC_PLAYER_EAST,
      "S" => Bcalc::Lib::BCALC_PLAYER_SOUTH,
      "W" => Bcalc::Lib::BCALC_PLAYER_WEST,
    }
    MAX_TRICKS = 13
    private_constant :MAX_TRICKS

    attr_reader :deal, :declarer, :suit

    def initialize(deal:, declarer:, suit:)
      PLAYERS.keys.include?(declarer) || raise(ArgumentError, "Wrong declarer value: #{declarer}")
      SUITS.keys.include?(suit) || raise(ArgumentError, "Wrong suit value: #{suit}")

      @deal = deal
      @declarer = declarer
      @suit = suit
    end

    # Returns number of tricks that declarer can take
    def tricks
      solver = Bcalc::Lib.bcalcDDS_new("PBN", deal, SUITS[suit], leader)
      raise_on_error(solver)
      result = Bcalc::Lib.bcalcDDS_getTricksToTake(solver)
      MAX_TRICKS - result
    ensure
      Bcalc::Lib.bcalcDDS_delete(solver)
    end

    private

    def raise_on_error(solver)
      if (error = Bcalc::Lib.bcalcDDS_getLastError(solver))
        raise StandardError, error
      end
    end

    def leader
      index = (PLAYERS.keys.index(declarer) + 1) % 4
      PLAYERS[PLAYERS.keys[index]]
    end
  end
end
