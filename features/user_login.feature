Feature: User logs in with a Google or Github account
  As a user of the app
  I want to login with a Google or Github account
  So that it is more convienent 

Scenario: Login with Google
  Given I am on the home page
  When I go to the login page
  Then I should see "Sign In"
  Then I follow " Sign in with Google "

Scenario: Login with GitHub
  Given I am on the home page
  When I go to the login page
  Then I should see "Sign In"
  Then I follow " Sign in with Github "