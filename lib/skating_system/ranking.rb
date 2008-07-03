module SkatingSystem
  class Ranking
    attr_accessor :rank_table
    
    def initialize
      @rank_table={ }
    end
    
    #Ads a new result to this ranking
    def add(place, competitor)
      raise "too many couples in higher placings" if places_higher_than(place) >= place
      
      competitors = @rank_table[place] || []
      competitors  << competitor
      @rank_table[place] = competitors
    end

    def place_for(competitor)
      rank_table.each do |key, value|
        return key if value.include?(competitor)
      end
      raise "Unkown competitor"
    end

    def places_higher_than(place)
      higher_placings = 0
      1.upto(place-1) do |p|
        higher_placings +=  @rank_table[p] ? @rank_table[p].size : 0
      end
      return higher_placings
    end

  end
end
