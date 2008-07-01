require File.dirname(__FILE__)+'/../spec_helper'

describe SkatingSystem::PerformanceResults, "tallying the marks" do
  before(:all) do
    @performance_resuts = SkatingSystem::PerformanceResults.new
    
    @judge1 = mock("Judge")
    @judge2 = mock("Judge")
    @judge3 = mock("Judge")
    
    @entree1 = mock("Entree")
    @entree2 = mock("Entree")
    @entree3 = mock("Entree")
    
    #    A  B  C     1 2 3
    # 1  1  1  3     2 2 3    1
    # 2  2  3  2     0 2 3    2
    # 3  3  2  3     0 1 3    3
    @couples_marks = { @entree1=>{@judge1=>1, @judge2=>1, @judge3=>3 },
      @entree2=>{@judge1=>2, @judge2=>3, @judge3=>2 },
      @entree3=>{@judge1=>3, @judge2=>2, @judge3=>3 }} 
    
    @performance_resuts.score(@couples_marks)
  end
  
  it "should know how many first places entree1 got" do
    @performance_resuts[@entree1][1].should be(2)
  end
  
  it "should know how many first places entree2 got" do
    @performance_resuts[@entree2][1].should be(0)
  end

  it "should know how many first places entree3 got" do
    @performance_resuts[@entree3][1].should be(0)
  end
  
  it "should know how many 2nd or better places entree1 got" do
    @performance_resuts[@entree1][2].should be(2)
  end

  it "should know how many 2nd or better places entree2 got" do
    @performance_resuts[@entree2][2].should be(2)
  end

  it "should know how many 2nd or better places entree3 got" do
    @performance_resuts[@entree3][2].should be(1)
  end

  it "should know how many 3rd or better places entree1 got" do
    @performance_resuts[@entree1][3].should be(3)
  end

  it "should know how many 3rd or better places entree2 got" do
    @performance_resuts[@entree2][3].should be(3)
  end

  it "should know how many 3rd or better places entree3 got" do
    @performance_resuts[@entree3][3].should be(3)
  end
  
end
#
#
#describe "scoring a final that can be decided on just rule 5" do
#  before(:all) do
#    @performance_resuts = PerformanceResults.new
#    
#    @judge1 = mock_model(Judge)
#    @judge2 = mock_model(Judge)
#    @judge3 = mock_model(Judge)
#    
#    @entree1 = mock_model(Entree)
#    @entree2 = mock_model(Entree)
#    @entree3 = mock_model(Entree)
#    
#    #    A  B  C     1 2 3
#    # 1  1  1  3     2 2 3    1
#    # 2  2  3  2     0 2 3    2
#    # 3  3  2  3     0 1 3    3
#    @couples_marks = { @entree1=>{@judge1=>1, @judge2=>1, @judge3=>3 },
#      @entree2=>{@judge1=>2, @judge2=>3, @judge3=>2 },
#      @entree3=>{@judge1=>3, @judge2=>2, @judge3=>3 }} 
#    
#    @performance_resuts.score(@couples_marks)
#  end
#  
#  it "should list entree 1 as first place" do
#    @performance_resuts[@entree1][:result].should be(1)
#  end 
#  
#  it "should list entree 2 as second place" do
#    @performance_resuts[@entree2][:result].should be(2)
#  end 
#
#  it "should list entree 3 as third place" do
#    @performance_resuts[@entree3][:result].should be(3)
#  end 
#end
#
#
#describe "scoring a final that requires rule 6" do
#  
#  before(:all) do
#    @performance_resuts = PerformanceResults.new
#    
#    @judgea = mock_model(Judge)
#    @judgeb = mock_model(Judge)
#    @judgec = mock_model(Judge)
#    @judged = mock_model(Judge)
#    @judgee = mock_model(Judge)
#    
#    @entree1 = mock_model(Entree, :number=>1)
#    @entree2 = mock_model(Entree, :number=>2)
#    @entree3 = mock_model(Entree, :number=>3)
#    @entree4 = mock_model(Entree, :number=>4)
#    @entree5 = mock_model(Entree, :number=>5)
#    
#    #    A  B  C  D  E    1  2  3  4  5 
#    # 1  1  1  1  5  5    3              1
#    # 2  4  2  4  1  2    1  3           3
#    # 3  2  4  2  2  1    1  4           2
#    # 4  3  5  3  4  4          2        5
#    # 5  5  3  5  3  3          3        4
#    
#    @couples_marks = { 
#      @entree1=>{@judgea=>1, @judgeb=>1, @judgec=>1, @judged=>5, @judgee=>5 },
#      @entree2=>{@judgea=>4, @judgeb=>2, @judgec=>4, @judged=>1, @judgee=>2 },
#      @entree3=>{@judgea=>2, @judgeb=>4, @judgec=>2, @judged=>2, @judgee=>1 },
#      @entree4=>{@judgea=>3, @judgeb=>5, @judgec=>3, @judged=>4, @judgee=>4 },      
#      @entree5=>{@judgea=>5, @judgeb=>3, @judgec=>5, @judged=>3, @judgee=>3 }
#    } 
#    
#    @performance_resuts.score(@couples_marks)
#  end
#  
#  it "should list entree 1 as first place" do
#    @performance_resuts[@entree1][:result].should be(1)
#  end 
#  
#  it "should list entree 2 as third place" do
#    @performance_resuts[@entree2][:result].should be(3)
#  end 
#
#  it "should list entree 3 as second place" do
#    @performance_resuts[@entree3][:result].should be(2)
#  end 
#
#  it "should list entree 4 as fifth place" do
#    @performance_resuts[@entree4][:result].should be(5)
#  end 
#
#  it "should list entree 5 as forth place" do
#    @performance_resuts[@entree5][:result].should be(4)
#  end 
#end
#
#
#describe "scoring a final that requires rule 7" do
#  
#  before(:all) do
#    @performance_resuts = PerformanceResults.new
#    
#    @judgea = mock_model(Judge)
#    @judgeb = mock_model(Judge)
#    @judgec = mock_model(Judge) 
#    @judged = mock_model(Judge)
#    @judgee = mock_model(Judge)
#    
#    @entree1 = mock_model(Entree, :number=>1)
#    @entree2 = mock_model(Entree, :number=>2)
#    @entree3 = mock_model(Entree, :number=>3)
#    @entree4 = mock_model(Entree, :number=>4)
#    @entree5 = mock_model(Entree, :number=>5)
#    
#    #    A  B  C  D  E    1  2  3  4  5 
#    # 1  1  1  1  5  5    3              1
#    # 2  2  4  3  2  2       3           3
#    # 3  4  2  4  1  1    2  3           2
#    # 4  3  5  2  4  4       1  2        5
#    # 5  5  3  5  3  3          3        4
#    
#    @couples_marks = { 
#      @entree1=>{@judgea=>1, @judgeb=>1, @judgec=>1, @judged=>5, @judgee=>5 },
#      @entree3=>{@judgea=>2, @judgeb=>3, @judgec=>4, @judged=>2, @judgee=>2 },
#      @entree2=>{@judgea=>4, @judgeb=>2, @judgec=>4, @judged=>1, @judgee=>1 },
#      @entree4=>{@judgea=>3, @judgeb=>5, @judgec=>2, @judged=>4, @judgee=>4 },      
#      @entree5=>{@judgea=>5, @judgeb=>3, @judgec=>5, @judged=>3, @judgee=>3 }
#    } 
#      
#    @performance_resuts.score(@couples_marks)
#  end
#  
#  it "should list entree 1 as first place" do
#    @performance_resuts[@entree1][:result].should be(1)
#  end 
#  
#  it "should list entree 2 as third place" do
#    @performance_resuts[@entree2][:result].should be(3)
#  end 
#
#  it "should list entree 3 as second place" do
#    @performance_resuts[@entree3][:result].should be(2)
#  end 
#
#  it "should list entree 4 as fifth place" do
#    @performance_resuts[@entree4][:result].should be(5)
#  end 
#
#  it "should list entree 5 as forth place" do
#    @performance_resuts[@entree5][:result].should be(4)
#  end 
#end
