# Used to test the complexity of a string.
#
# Usage
# -----
#
# Complexity.score("This")  --> 2
# Complexity.score("this")  --> 1
# Complexity.score("This1") --> 3
# Complexity.score("this!")  --> 2
#

module Complexity
  PATTERNS = {
    :numbers => /\d/,
    :lower_case => /[a-z]/,
    :upper_case => /[A-Z]/,
    :non_alphanumeric_characters => /[^A-Za-z0-9\s]/
  }

  def self.score(item)
    @item = item
    @score = 0
    increment_score_if_item_matches_pattern
    return @score
  end

  def self.criteria
    PATTERNS.keys
  end

  def self.critera_strings
    criteria.collect{|c| c.to_s.gsub(/_/, " ")}
  end

  private
  def self.increment_score_if_item_matches_pattern
    for pattern in PATTERNS.values
      @score += 1 if @item =~ pattern
    end
  end
end
