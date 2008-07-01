steps_for(:scrutineering_a_final_performance) do

  class Judges
    def initialize(*letters)
      @judge_letters = letters
    end
    
    def hashed_marks(*marks)
      h = {}
      @judge_letters.each_with_index do |judge, index|
        h[judge]=marks[index].to_i
      end
      h
    end

end


  Given "couples $one, $two, $three, $four, $five, $six" do |one, two, three, four, five, six|
    couples = [one, two, three, four, five, six]
    @couples_marks = { }
    couples.each do |c|
     @couples_marks[c]={}
    end

  end

  Given "judges $a, $b, $c, $d, $e" do |a, b, c, d, e|
    @judges = Judges.new(a,b,c,d,e)
  end

  When "couple $number gets $a, $b, $c, $d, $e" do |number, a, b, c, d, e|
    @couples_marks[number]=@judges.hashed_marks(a,b,c,d,e)
  end

  When "I compute the results" do
    @res=SkatingSystem::PerformanceResults.new
    @res.score(@couples_marks)
  end
  
  Then "couple $couple is in place $place" do |couple, place|
    @res[couple][:result].should be(place.to_i)
  end
  
end
