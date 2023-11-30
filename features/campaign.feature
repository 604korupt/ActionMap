Feature: User can search a finance campaign
  As a user of the app
  I want to click a year and category
  So that I can see the representatives for the finance campaign

Scenario: Searching
  Given I am on the home page
  When I go to the campaign_finance page
  When I press "Search"
  Then I should see "MCMAHON, LINDA"