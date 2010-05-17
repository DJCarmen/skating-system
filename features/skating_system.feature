Feature: Scrutineer a recalled raound
  In order recall couples into the next round
  As a scrutineer
  I want to list the judges marks and get the couples in the next round

  Background:
    Given An event "event" exists
      And Event "event" has round "round" (know as the round)
      And couples "1,7,16,24,50,79,80" have entered the round
      And judges "A,B,C" are judging the round
      
  Scenario: Simple Case
    Given inspiration
    When I create a sweet new gem
    Then everyone should see how awesome I am
