require "minitest/autorun"
require_relative "../config.rb"

class TestPencil < Minitest::Test
  def setup
    @paper = Paper.new
  end
  def test_writing_on_paper
    pencil = Pencil.new
    pencil.write "test", @paper
    assert_equal "test", @paper.text
    pencil.write " 2", @paper
    assert_equal "test 2", @paper.text
  end

  def test_pencil_durability
    pencil = Pencil.new durability: 100
    pencil.write "test", @paper
    assert_equal pencil.durability, 96
  end
end
