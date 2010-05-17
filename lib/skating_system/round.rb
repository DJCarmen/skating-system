module SkatingSystem
  class Round
    attr_reader :name

    def initialize(name)
      @name = name
    end
    
    def add_couple(number)
      @couples ||= []
      @couples << Couple.new(number)
    end
    
    def couple_numbers
      @couples.map{|c| c.number}
    end
    
    def add_judge(letter)
      @judges ||= []
      @judges << Judge.new(letter)
    end
    
    def judge_letters
      @judges.map{|j| j.letter}
    end
    
    
    
    
    
    
    
    
        
    def add_judges(judges)
    end
    
    def number_recalled=(recall_count)
      @recall_count = recall_count
    end
    
    def add_recalls(judge, dance, couples)
      couples.each do |number|
        couple = find_couple(number)
        couple.add_recall(judge, dance)
      end
    end
    
    def couples_recalled
      @couples.sort{|a, b| b.recalls <=> a.recalls}[0...@recall_count]
    end
    
    def final=(is_final)
    end
    
    private
    def find_couple(number)
      @couples.select{|couple| couple.number==number}.first
    end
  end
end