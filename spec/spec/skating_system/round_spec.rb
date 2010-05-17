require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe SkatingSystem::Round do

  describe "on creation" do
    it "can take a name" do
      round = SkatingSystem::Round.new("Round 1")
      round.name.should == "Round 1"
    end
  end

  describe "after creation" do
    before(:each) do
      @round = SkatingSystem::Round.new("Round 1")
    end
    
    it "can have a couple added by number" do
      @round.add_couple(45)
      @round.couple_numbers.should be_include(45)
    end
    
    it "can have a judge added by letter" do
      @round.add_judge("A")
      @round.judge_letters.should be_include("A")
    end
  end
end