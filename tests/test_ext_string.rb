require "minitest/autorun"
require_relative "../config.rb"

class TestExtString < Minitest::Test
  def test_lower
    assert "a".lowercase?
  end

  def test_upper
    assert "A".uppercase?
  end

  def test_lower_count
    assert_equal 2, "AAaaBB".lowercase_count
  end

  def test_upper_count
    assert_equal 4, "AAaaBB".uppercase_count
  end

  def test_numbers
    assert_equal 2, "AAbbb12".uppercase_count
    assert_equal 3, "AAbbb12".lowercase_count
  end
end
