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
    | Compute Science | Computer Science |
  
  Given the user "1" belongs to the groups "1, 2, 3"

Scenario: Subscribe to group
  Given I am on the student details page
  When I follow "Bob"
  Then I should be on the student details page for "jbsmith123@citadel.edu"
  When I subscribe to "Cybersecurity"
  Then I should be on the student details page for "jbsmith123@citadel.edu"
  And the user should be subscribed to "Cybersecurity"
  
Scenario: Unsubscribe from group
  Given I am on the student details page
  When I follow "Bob"
  Then I should be on the student details page for "jbsmith123@citadel.edu"
  When I unsubscribe from "ACM"
  Then I should be on the student details page for "jbsmith123@citadel.edu"
  And the user should be unsubscribed from "ACM"
  
Scenario: Create new user
  Given I am on the create student page
  When I fill in "First Name" with "John"
  When I fill in "Last Name" with "Smith"
  When I fill in "Email" with "smithj1citadel.edu"
  When I fill in "Password" with "Password1234"
  #When I uncheck "ACM"
  #When I uncheck "Cybersecurity"
  #When I uncheck "Computer Science"
  When I press "Confirm"
  Then I should be on the student details page
  And the user should be subscribed to "Computer Science"
  