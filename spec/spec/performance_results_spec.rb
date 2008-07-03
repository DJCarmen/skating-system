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

describe SkatingSystem::PerformanceResults, "getting the rankings" do
  before(:each) do
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

    SkatingSystem::Ranking.stub!(:new).and_return(@ranking = mock(SkatingSystem::Ranking))
    @ranking.stub!(:add) 

              @performance_resuts.score(@couples_marks)
  end

  it "should return a Ranking when asked for one" do
    @performance_resuts.ranking.should be(@ranking)
  end

  it "should add couple 1 to the ranking in first place" do
    @ranking.should_receive(:add).with(1, @entree1)
    @performance_resuts.ranking
  end

  it "should add couple 2 to the ranking in second place" do
    @ranking.should_receive(:add).with(2, @entree2)
    @performance_resuts.ranking
  end

  it "should add couple 3 to the ranking in third place" do
    @ranking.should_receive(:add).with(3, @entree3)
    @performance_resuts.ranking
  end
end
