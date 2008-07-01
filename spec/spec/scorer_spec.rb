require File.dirname(__FILE__) + '/../spec_helper'


describe "scoring a final performance" do
  before(:each) do
    @scorer = SkatingSystem::Scorer.new
    @performance = mock("Performance")
    @couples_marks = {:key=>:value }
    SkatingSystem::PerformanceResults.stub!(:new).and_return(@pr=mock(SkatingSystem::PerformanceResults, :score=>nil))
    @performance.stub!(:couples_marks).and_return(@couples_marks)
  end
  
  it "should check if the scorable thing respondes to :couples_marks" do
    @performance.should_receive(:respond_to?).with(:couples_marks).and_return(true)
    @scorer.score(@performance)
  end
  
  it "should delegate to score_performance" do
    @scorer.should_receive(:score_performance).with(@performance)
    @scorer.score(@performance)
  end
  
  it "should return a the new Performance" do
    @scorer.score_performance(@performance).should be(@pr)
  end
  
  it "should ask the PerformanceResults to score itself" do
    @pr.should_receive(:score).with(@couples_marks)
    @scorer.score(@performance)
  end
end
