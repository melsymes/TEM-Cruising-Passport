Feature: User connects with marina

  As a signed up user I want to connect to a marina - ready to be accepted by the marina manager

@javascript
Scenario: User connects with marina
  Given A user "Charles" with email "charles@example.com" and password "shockwave"
  Given one marinas
  Then I login with email "charles@example.com" and password "shockwave"
  And verify I'm on the home page
  And "charles@example.com" should have 1 email
  Then I go to "Marinas"
  Then I connect with the marina
  #And verify that I am pending with "newlands marina"
  And "charles@example.com" should have 2 email
  And verify my status is pending
  Then user logs out