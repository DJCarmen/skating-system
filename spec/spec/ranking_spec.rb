require File.dirname(__FILE__) + '/../spec_helper'

describe SkatingSystem::Ranking do
  before(:each) do
    @ranking = SkatingSyatem::Ranking.new
  end
end


describe SkatingSystem::Ranking, "adding new results" do
  
  before(:each) do
    @ranking = SkatingSystem::Ranking.new
  end
    
  it "should put an entry in first place when they are entered in first place" do
    entree = mock("Entree")
    @ranking.add(1, entree)
    @ranking.place_for(entree).should be(1)
  end
  
  it "should put both entries in first place when entered in first place, even if there is already a first place" do
    entree1 = mock("Entree")
    entree2 = mock("Entree")
    @ranking.add(1, entree1)
    @ranking.add(1, entree2)
    @ranking.place_for(entree1).should be(1)
    @ranking.place_for(entree2).should be(1)
  end
  
  it "should put an entry in second place when entred in second place" do
    entree = mock("Entree")
    @ranking.add(2, entree)
    @ranking.place_for(entree).should be(2)
  end

  it "should put both in second place when netered in second place, even if there is already a second place" do
    entree1 = mock("Entree")
    entree2 = mock("Entree")
    @ranking.add(2, entree1)
    @ranking.add(2, entree2)
    @ranking.place_for(entree1).should be(2)
    @ranking.place_for(entree2).should be(2)
  end
  
  it "should not allow an entry in second place if there are two first places" do       
    entree1 = mock("Entree")
    entree2 = mock("Entree")
    entree3 = mock("Entree")
    @ranking.add(1, entree1)
    @ranking.add(1, entree2)
    lambda{ @ranking.add(2, entree3)}.should raise_error
  end

  it "should reise an exception if asked about an unknown entree" do
    lambda{ @ranking.place_for(mock("Entree"))}.should raise_error
  end

  
  
end
