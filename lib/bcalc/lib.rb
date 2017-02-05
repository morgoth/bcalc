require "ffi"

module Bcalc
  module Lib
    extend FFI::Library

    ffi_lib "ext/bcalc/libbcalcdds.so"

    attach_function :bcalc_runtimeVersion, [], :ulong_long
    attach_function :bcalcDDS_new, [:string, :string, :int, :int], :pointer
    attach_function :bcalcDDS_getTricksToTake, [:pointer], :int
  end
end
