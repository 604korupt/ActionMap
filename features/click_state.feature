Feature: User can click on state to see a list of counties
        As a user
        I want to check county representative
        So that I could click on certain state on map

Background:
  Given all the states exist

Scenario: User is able to click on valid state
  Given I am on the map page
  Then I follow "CA"
  Then I should see "California"


