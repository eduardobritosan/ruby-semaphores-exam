require "../lib/exam"
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
    assert_equal("0", @vacia.value)
    
  end
  def test_type_check
    assert_raise(RuntimeError) {Complejo.new('1','1')}
  end
  def test_failure
    assert_equal("(5,5)",(@origen*5).to_s,"Producto escalar")
  end
end
