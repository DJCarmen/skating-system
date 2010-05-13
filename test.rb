$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require "skating_system"

event = SkatingSystem::Event.new

#For a recalled round
round = event.new_round [1,7,16,24,50,79, 80]
round.add_judges ["A", "B", "C"]
round.number_recalled = 6

round.add_recalls "A", :cha, [1,7,16,24,50,80]
round.add_recalls "B", :cha, [1,7,16,24,50,80]
round.add_recalls "C", :cha, [1,7,16,24,50,80]
round.add_recalls "A", :jive, [1,7,16,24,50,80]
round.add_recalls "B", :jive, [1,7,16,24,50,79]
round.add_recalls "C", :jive, [1,7,16,24,50,79]
recalled_couples = round.couples_recalled #Returns an array
puts recalled_couples.map{|c| c.number}

#For a final
# round = event.new_round recalled_couples
# round.add_judges ["B", "C", "D"]
# round.final = true
# 
# round.add_recalls "B", :cha, [50,79,1,7,16,24]
# round.add_recalls "C", :cha, [16,24,1,7,50,79]
# round.add_recalls "D", :cha, [24,50,1,7,16,79]
# round.add_recalls "B", :jive, [50,79,1,7,16,24]
# round.add_recalls "C", :jive, [16,24,1,7,50,79]
# round.add_recalls "D", :jive, [24,50,1,7,16,79]
# event.results                             #Returns an arra
