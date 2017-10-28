require "minitest/autorun"
require_relative "../config.rb"

class TestPencil < Minitest::Test
  def test_writing_on_paper
    paper = Paper.new
    pencil = Pencil.new
    pencil.write "test", paper
    assert_equal "test", paper.text
    pencil.write " 2", paper
    assert_equal "test 2", paper.text
  end
end
