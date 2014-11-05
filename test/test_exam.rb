require "../lib/exam.rb"
require 'test/unit'


class DoubleList < Test::Unit::TestCase
  def setup
    @vacia = DoubleList.new
    @vacia.push(1)
    @vacia.push(2)
    @vacia.push(3)
  end
  def tear_down
    # nothing
  end
  def test_simple
    assert_equal("1", @vacia.value)
    
  end
  def test_type_check
    assert_raise(RuntimeError) {DoubleList.new(1)}
  end
  def test_failure
    assert_equal("(5,5)",(@vacia*5).to_s,"Producto escalar")
  end
end
