Given /^couples "([^\"]*)" have entered the round$/ do |couples|
  raise "the round is not defined" unless @round
  couple_numers = couples.split(",")
  couple_numers.each {|num| @round.add_couple(num)}
end

Given /^judges "([^\"]*)" are judging the round$/ do |judges|
  raise "the round is not defined" unless @round
  judge_letters = judges.split(",")
  judge_letters.each {|letter| @round.add_judge(letter)}
end

