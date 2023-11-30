Feature: User can go to the my_events page to create the event
  As a user of the app
  
Scenario:
  Given I am on the home page
  When I go to the login page
  Then I should see "Sign In"
  Then I press "Sign in with Google"
  Then I should see "National Map"
  When I go to the new_my_event page
  Then I should see "New event"

Scenario:
  Given I am on the home page
  When I go to the login page
  Then I should see "Sign In"
  Then I press "Sign in with Google"
  Then I should see "National Map"
  When I go to the new_my_event page
  Then I follow "View all events"
  Then I should see "Event"
