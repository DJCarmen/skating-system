Given /^An event "([^\"]*)" exists$/ do |event|
  @events ||= {}
  @events[event] ||= SkatingSystem::Event.new
end

Given /^Event "([^\"]*)" has round "([^\"]*)" \(know as the round\)$/ do |event, round|
  raise "Event #{event} doesn't exist" unless @events[event]
  event = @events[event]
  @round = event.new_round round
end

