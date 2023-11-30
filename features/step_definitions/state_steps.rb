# frozen_string_literal: true

Given(/some default states exist/) do
  State.create!(
    name:         'California',
    symbol:       'CA',
    fips_code:    '06',
    is_territory: 0,
    lat_min:      '-124.409591',
    lat_max:      '-114.131211',
    long_min:     '32.534156',
    long_max:     '-114.131211'
  )
  County.create!(
  name: "Lake County",
  state_id: 1, # 这里需要一个有效的 state_id
  fips_code: 123, # 这是一个示例 FIPS 代码
  fips_class: "H1", # 这是一个示例 FIPS 类别代码
  created_at: DateTime.now,
  updated_at: DateTime.now
)
end

Then(/I click "([^"]*)" on the state map/) do |string|
  visit "state/#{string}"
end

Then(/^I click on county (.+)$/) do |county|
  visit search_representatives_path(county)
end
