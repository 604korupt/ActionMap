# frozen_string_literal: true

# string is symbol here
Then('I click {string} on state map') do |string|
  visit "state/#{string}"
end
