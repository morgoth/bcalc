require "ffi"

module Bcalc
  module Lib
    extend FFI::Library

    BCALC_PLAYER_NORTH = 0
    BCALC_PLAYER_EAST = 1
    BCALC_PLAYER_SOUTH = 2
    BCALC_PLAYER_WEST = 3

    BCALC_SUIT_CLUBS = 0
    BCALC_SUIT_DIAMONDS = 1
    BCALC_SUIT_HEARTS = 2
    BCALC_SUIT_SPADES = 3
    BCALC_NT = 4

    ffi_lib "ext/bcalc/libbcalcdds.so"

    attach_function :bcalc_runtimeVersion, [], :int
    attach_function :bcalcDDS_new, [:string, :string, :int, :int], :pointer
    attach_function :bcalcDDS_getTricksToTake, [:pointer], :int
    attach_function :bcalcDDS_delete, [:pointer], :void
    attach_function :bcalcDDS_getLastError, [:pointer], :string
  end
end
