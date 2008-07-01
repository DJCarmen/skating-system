module SkatingSystem
  class PerformanceResults
    
    def score(marks)
      @marks = marks
      @majority = (@marks[@marks.keys.first].size/2).ceil
      
      tally_marks

      compute_results
      
      @marks.each do |entree, marks|
        @marks[entree].merge!(@tally[entree])
        @marks[entree].merge!(@results[entree])
      end
    end
    
    def sum_marks(entree, position)
      sum=0
      @marks[entree].each do |judge, place|
        sum += place if place <= position
      end
      sum
    end
    
    def compute_results
      @results={ }
      @marks.each do |entree, marks|
        @results[entree] ||= { }
      end
      
      @next_result_to_compute = 1
      
      1.upto(@marks.size) do |place|  
        
        
        sorted_candidate = candidates(place).sort do |entree1, entree2| 
          comparator = @tally[entree2][place] <=> @tally[entree1][place] 
          if comparator==0
            comparator = sum_marks(entree2, place) <=> sum_marks(entree1, place) 
          end 
          comparator
        end
        
        sorted_candidate.each do |entree|
          @results[entree][:result]=@next_result_to_compute
          @next_result_to_compute += 1
        end
      end
    end
    
    #Computes an array of entrees that are candidates for this position 
    def candidates(place)
      candidates = []
      @tally.each do |entree, places|
        unless @results[entree][:result]
          candidates << entree if places[place] > @majority
        end
      end
      candidates
    end

    def [](key)
      @marks[key]
    end

    private
    #Tallys the number of judges who marked each entree in each place or heigher
    # and writes the results to @tally
    # eg given the results
    #    A  B  C 
    # 1  1  1  3 
    # 2  2  3  2 
    # 3  3  2  3 
    # it assigns the tally
    #    1  2  3
    # 1  2  2  3
    # 2  0  2  3
    # 3  0  1  3
    def tally_marks
      @tally={ }
      @marks.each do |entree, marks|
        @tally[entree] ||= { }
        1.upto(@marks.size) do |place|
          @tally[entree][place] = 0
        end
      end
      
      @marks.each do |entree, marks|
        marks.each do |judge, placing|
          placing.upto(@marks.size) do |place|
            @tally[entree][place] += 1
          end
        end
      end
      
    end
    
  end
end


