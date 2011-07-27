$:.unshift File.join(File.dirname(__FILE__),'../..','complexity/lib')

require 'test/unit'
require 'random_string'
require 'complexity'

class RandomStringTest < Test::Unit::TestCase

  def test_new_random_string
    assert_match /^[A-Za-z0-9]+$/, RandomString.new
    assert 3 <= Complexity.score(RandomString.new), "String not complex enough"
    assert_not_equal RandomString.new, RandomString.new
  end

  def test_new_random_string_with_length
    assert_equal 40, RandomString.new.length
    for test_length in [10, 23, 50, 97, 140]
      assert_equal test_length, RandomString.new(test_length).length
    end
  end

end
