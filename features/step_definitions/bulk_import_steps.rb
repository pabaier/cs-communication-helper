When /^(?:|I )upload a file with valid data for 3 new users$/ do
  attach_file(:file, File.join('features', 'upload_files', 'good_csv.csv'))
#   attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload_files', 'good_csv.csv'))
  click_button "Import CSV"
end

Then("the number of users should increase by {int}") do |int|
  # Write code here that turns the phrase above into concrete actions
end
 
When /^(?:|I )upload a bad file$/ do
  attach_file(:file, File.join('features', 'upload_files', 'bad_csv.csv'))
#   attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload_files', 'bad_csv.csv'))
  click_button "Import CSV"
end

Then("the number of users should not change") do
  # Write code here that turns the phrase above into concrete actions
end