$:.unshift File.join(File.dirname(__FILE__),'../..','complexity/lib')

require 'test/unit'
require 'complexity'

class ComplexityTest < Test::Unit::TestCase
  def setup
    @strings = {
      "AAAAA" => 1,
      "aaaaa" => 1,
      "121212" => 1,
      "aaBBB" => 2,
      "aa11" => 2,
      "AA44" => 2,
      "AA44cc" => 3,
      "Hi!" => 3,
      "Get3?" => 4,
      "!£$@" => 1
    }
    @upper_case = :upper_case
    @lower_case = :lower_case
    @numbers = :numbers
    @non_alphanumeric_characters = :non_alphanumeric_characters
    @criteria = [@upper_case, @lower_case, @numbers, @non_alphanumeric_characters]
  end

  def test_complexity
    @strings.each do |string, score|
      assert_equal(score, Complexity.score(string), "Complexity of #{string} should be #{score}")
    end
  end

  def test_criteria
    for criterion in @criteria
      assert(Complexity.criteria.include?(criterion), "Criteria should include #{criterion}. #{Complexity.criteria.inspect}")
    end
  end

  def test_criteria_strings
    for criterion in @criteria
      text = criterion.to_s.gsub(/\_/, " ")
      assert(Complexity.critera_strings.include?(text), "Criteria strings should include #{text}. #{Complexity.critera_strings.inspect}")
    end
  end
end