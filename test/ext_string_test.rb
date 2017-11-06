require "minitest/autorun"
require_relative "../config.rb"

class TestExtString < Minitest::Test
  def test_upper
    assert "A".uppercase?
    assert !"a".uppercase?
  end

  def test_upper_count
    assert_equal 4, "AAaaBB".uppercase_count
  end

  def test_upper_count_with_numbers
    assert_equal 2, "AAbbb12".uppercase_count
  end

  def test_printable_length
    assert_equal 4, "11 1\n1".printable_length
  end

  def test_to_integer_or_nil
    assert_equal 3, "3".to_integer_or_nil
    assert_equal nil, "".to_integer_or_nil
    assert_equal nil, "abc1".to_integer_or_nil
  end
end
