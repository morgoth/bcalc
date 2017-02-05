require "test_helper"

class BcalcTest < Minitest::Test
  def test_returns_version
    refute_nil ::Bcalc::VERSION
  end
end
