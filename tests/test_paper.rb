require "minitest/autorun"
require_relative "../config.rb"

class TestPaper < Minitest::Test
  def test_new_paper
    paper = Paper.new
    assert_equal "", paper.text
  end
end
