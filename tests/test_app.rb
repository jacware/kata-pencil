require "minitest/autorun"
require_relative "../config.rb"

class TestApp < Minitest::Test
  def setup
    @pencil = Pencil.new
  end

  def test_printing_a_new_paper
    assert_equal '', PencilKata.new(@pencil).command(['print'])
  end

  def test_writing_on_a_paper
    pk = PencilKata.new(@pencil)
    pk.command(['write','test'])
    assert_equal 'test', pk.command(['print'])
  end

  def test_exiting_the_app
    assert_equal false, PencilKata.new(@pencil).command(['exit'])
  end
end
