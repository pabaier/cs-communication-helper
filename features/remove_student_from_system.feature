Feature: Remove user from system
    As an admin
    So that I can stop contacting a student
    I want to be able to remove a student from the communication helper database
  
Background: users in database
  Given the following users exist:
  | first_name  | last_name | email                 | password | status  | graduation_date |   
  | Bob         | Manman    | jbsmith123@citadel.edu | pass123  | student | 12/12/12 |
  
Scenario: Check box to subscribe to group
  Given I am on the student details page
  Then I should see "jbsmith123@citadel.edu"
  When I check "ACM_jbsmith123@citadel.edu"
  #When I follow "Save"
  #Then I should be on the student details page
  Then the "ACM_jbsmith123@citadel.edu" checkbox should be checked

Scenario: Uncheck box to subscribe to group
  Given I am on the student details page
  Then I should see "jbsmith123@citadel.edu"
  When I uncheck "ACM_jbsmith123@citadel.edu"
  #When I follow "Save"
  #Then I should be on the student details page
  Then the "ACM_jbsmith123@citadel.edu" checkbox should not be checked