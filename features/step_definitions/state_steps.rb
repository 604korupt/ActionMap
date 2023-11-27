# frozen_string_literal: true

# string is symbol here
Then('I click {string} on the state map') do
  visit "state/#{string}"
end

Then(/^I click on county (.+)$/) do |county|
  visit search_representatives_path(county)
end
