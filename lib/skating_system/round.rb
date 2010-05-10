module SkatingSystem
  class Round

    
    def initialize(couples)
      @couples = couples.map{|num| Couple.new(num)}
    end
    
    def add_judges(judges)
    end
    
    def number_recalled=(recall_count)
      @recall_count = recall_count
    end
    
    def add_recalls(judge, dance, couples)
      couples.each do |number|
        couple = find_couple(number)
        puts number
        raise couples.inspect unless couple
        couple.add_recall(judge, dance)
      end
    end
    
    def couples_recalled
      @couples.sort{|a, b| a.recalls <=> b.recalls}[0..@recall_count]
    end
    
    def final=(is_final)
    end
    
    private
    def find_couple(number)
      @couples.select{|couple| couple.number==number}.first
    end
  end
end