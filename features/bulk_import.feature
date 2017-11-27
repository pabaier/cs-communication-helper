Feature: CSV file upload
  As an admin
  So I can import a bunch of users at one time
  I want to be able to upload a CSV file with the users' data
  
Background: users in database
  Given the following users exist:
   | first_name  | last_name | email                       | password | status  | graduation_date |   
   | Bob         | Manman    | jbsmith123@citadel.edu      | pass123  | student | 12/12/12        |
   | Jan         | Tinkerton | tinkerbell88@neverland.pixi | peter    | Admin   | 1/2/20          | 

Scenario: Uploading a valid file with new users
  Given I am on the users page
  When I upload a file with valid data
  Then the number of users should be 5
  Then I should have the following users:
    | first_name|
    | Bob       |
    | Jan       |
    | Steve     |
    | Sam       |
    | Shelly    |

  And I should be on the users page

Scenario: Uploading a bad file
  Given I am on the users page
  When I upload a bad file
  Then the number of users should be 4
  Then I should have the following users:
  | first_name|
  | Bob       |
  | Jan       |
  | Sam       |
  | Shelly    |
  And I should be on the users page