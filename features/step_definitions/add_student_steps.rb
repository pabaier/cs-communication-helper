When("I choose {string} in {string}") do |date, calendar|
    select_date date, from: calendar
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
	  User.create!(user)
  end
end
