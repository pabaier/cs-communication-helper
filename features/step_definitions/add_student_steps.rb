When("I choose {string} in {string}") do |date, calendar|
    select_date date, from: calendar
end