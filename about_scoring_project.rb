require File.expand_path(File.dirname(__FILE__) + '/neo')

# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  # You need to write this method
  ones = 0
  twos = 0
  threes = 0
  fours = 0
  fives = 0
  sixes = 0
  score = 0
  dice.each do |die|
    if die == 1
        ones += 1
    elsif die == 2
        twos += 1
    elsif die == 3
        threes += 1
    elsif die == 4
        fours += 1
    elsif die == 5
        fives += 1
    elsif die == 6
        sixes += 1
    end
  end

  if ones >= 3
    score += 1000
    extraones = ones - 3
    if extraones
      score += extraones * 100
    end
  elsif ones < 3
      score += ones * 100
  end

  if fives >= 3
    score += 500
    extrafives = fives - 3
    if extrafives
      score += extrafives * 50
    end
  elsif fives < 3
      score += fives * 50
  end

  if twos >= 3
      score += 2 * 100
  end

  if threes >= 3
      score += 3 * 100
  end

  if fours >= 3
      score += 4 * 100
  end

  if sixes >= 3
      score += 6 * 100
  end
  score
  # if ones.length == 3
  #   score += 1000
  # else
  #   ones.each do |die|
  #     score += 100
  #   end
  # end
  # if fives.length == 3
  #   score += 500
  # else
  #   fives.each do |die|
  #     score += 50
  #   end
  # end
  # secret_set = [set[0]]
  # if set.length >= 3
  #   set.each do |die|
  #     if secret_set.include?(die)
  #       secret_set << die
  #     end
  #   end
  #   if secret_set.length >= 3
  #     score += secret_set[0] * 100
  #   end
  # end
  # score
end

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
  end

end
