Feature: Add user to group
  As an admin
  So that I can organize students
  I want to be able to check a box for each group
  
Background: users in database
  Given the following users exist:
  | first_name  | last_name | email                  | password | status  | graduation_date |   
  | Bob         | Manman    | jbsmith123@citadel.edu | pass123  | student | 12/12/12        |
  
  Given the following groups exist:
    | title | description          |
    | ACM   | The compsci club     |
    | Cybersecurity | Cool hackers |
  
Scenario: Subscribe to group
  Given I am on the student edit details page for "jbsmith123@citadel.edu"
  When I subscribe to "Cybersecurity"
  Then I should be on the student detail page for "jbsmith123@citadel.edu"
  And I should see "Cybersecurity"
  
Scenario: Unsubscribe from group
  Given I am on the student edit details page for "jbsmith123@citadel.edu"
  When I unsubscribe from "ACM"
  Then I should be on the student detail page for "jbsmith123@citadel.edu"
  And I should not see "ACM"
