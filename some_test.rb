require './testy_testy'

class SomeTest < TestyTesty
  def test_truth
    assert true
  end

  def test_something_obvious
    assert [1,2,3].size == 3
  end

  def test_that_will_fail
    assert false
  end
  
end

class MoreTests < TestyTesty
  def test_arrays
    assert [1,2,3] == [1,2,3]
  end

  def test_strings
    assert "This" == "This"
  end

  def test_that_is_wrong
    assert "Ruby" == "Lisp"
  end
end

class QuicksortTest < TestyTesty
  require './quicksort'

  def random_array(n)
    (1..n).map{ rand(n) }
  end

  def test_quicksort_100
    arr = random_array(100)
    assert quicksort(arr) == arr.sort
  end

  def test_quicksort_1000
    arr = random_array(1000)
    assert quicksort(arr) == arr.sort
  end

  def test_q_100000
    arr = random_array(100000)
    assert q(arr) == arr.sort
  end
end
