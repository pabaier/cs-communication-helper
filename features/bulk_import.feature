Feature: CSV file upload
  As an admin
  So I can import a bunch of users at one time
  I want to be able to upload a CSV file with the users' data

Scenario: Uploading a valid file with data for 3 new users
  Given I am on the users page
  When I upload a file with valid data for 3 new users
  Then the number of users should increase by 3
  And I should be on the users page

Scenario: Uploading a bad file
  Given I am on the users page
  When I upload a bad file
  Then the number of users should not change
  And I should be on the users page