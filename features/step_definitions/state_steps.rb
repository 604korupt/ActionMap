# frozen_string_literal: true

# string is symbol here
Then('I click {string} on the state map') do |string|
  visit "state/#{string}"
end

<<<<<<< HEAD
Then('I should see {string} on the page') do |string|
  page.should have_content(string)
end

Then(/^I click on county (.+)$/) do |county|
  visit search_representatives_path(county)
end


=======
Then(/^I click on county (.+)$/) do |county|
  visit search_representatives_path(county)
end
>>>>>>> e59f8fd08d4bd4c0704541d225c63de43344d76e
