# frozen_string_literal: true

# string is symbol here
Then('I click {string} on the state map') do |string|
  visit "state/#{string}"
end


Then('I should see {string} on the page') do |string|
  page.should have_content(string)
end

Then(/^I click on county (.+)$/) do |county|
  visit search_representatives_path(county)
end



