module SkatingSystem
  class Scorer
    def score(scorable)
      score_performance(scorable) if scorable.respond_to?(:couples_marks)
    end
    
    def score_performance(performance)
      results = PerformanceResults.new
      results.score(performance.couples_marks)    
      results
    end
    
  end
end
