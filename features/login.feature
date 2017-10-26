Feature: Login user
  
Given: I am user John B. Smith. My email address is jbsmith123@citadel.edu, 
my password is password1234, and I have a role as an admin
Scenario: Login as admin
When I fill in “Email” with “jbsmith123@citadel.edu”
When I fill in “Password” with “password1234”
When I press “Confirm”
Then I am on the admin page

Given: I am user Jane B Smith. I have an email address of jbsmith124@citadel.edu, my password is password567, and I have a role as a student
Scenario: Login as a student
When I fill in “Email” with “jbsmith124@citadel.edu”
When I fill in “Password” with “password567”
When I press “Confirm”
Then I am on the student page

Given: I am John Doe. I do not have an email address, a password, nor do I have a role for this web application.

Scenario: Cannot login
When I fill in “Email” with “jdoe@citadel.edu”
When I fill in “Password” with “password”
When I press “Confirm”
Then I am on the login page
