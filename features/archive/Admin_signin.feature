Feature: Admin user logs in

  As an admin I want to be able to sign in and be on the Admin page


Scenario: Admin User signs in
  Given One admin user
  Then I login with email "user@example.com" and password "please"
  Then I go to "Admin"
  Then user logs out

#@javascript
#Scenario: User connects with a marina
#  Given one user and one marina
#  Then I login with email "new@example.com" and password "please"
#  And verify I'm on the home page
#  And "new@example.com" should have 1 email
#  Then I go to "Marinas"
#  Then I connect with "newlands marina"
  #And verify that I am pending with "newlands marina"
#  And "new@example.com" should have 2 email
#  And verify my status is pending
#  Then user logs out






