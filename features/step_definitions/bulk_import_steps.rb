When /^(?:|I )upload a file with valid data for 3 new users$/ do
  attach_file(:file, File.join('features', 'upload_files', 'good_csv.csv'))
#   attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload_files', 'good_csv.csv'))
  click_button "Import CSV"
end
 
When /^(?:|I )upload a bad file$/ do
  attach_file(:file, File.join('features', 'upload_files', 'bad_csv.csv'))
#   attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload_files', 'bad_csv.csv'))
  click_button "Import CSV"
end