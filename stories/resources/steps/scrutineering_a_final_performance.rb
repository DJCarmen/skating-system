steps_for(:scrutineering_a_final_performance) do

  class Judges
    def initialize(letters)
      @judge_letters = letters
    end
    
    def hashed_marks(marks)
      h = {}
      @judge_letters.each_with_index do |judge, index|
        h[judge]=marks[index].to_i
      end
      h
    end
  end


  Given /couples ((?:(?:\d+)(?:, )?)+)/ do |numbers|
    couples = numbers.split(", ")
    @couples_marks = { }
    couples.each do |c|
      @couples_marks[c]={}
    end
  end

  Given /judges ((?:(?:\w)(?:, )?)+)/ do |letters|
    @judges = Judges.new(letters.split(", "))
  end

  When /couple (\d+) gets ((?:(?:\d+)(?:, )?)+)/ do |number, marks|
    @couples_marks[number]=@judges.hashed_marks(marks.split(", "))
  end

  When "I compute the results" do
    @res=SkatingSystem::PerformanceResults.new
    @res.score(@couples_marks)
  end
  
  Then "couple $couple is in place $place" do |couple, place|
    @res[couple][:result].should be(place.to_i)
  end
  
end
