Feature: A user lists marinas

  as a logged in user
  I want to go to the Marinas page
  so I can list all the marinas


  Scenario: A user logs in
    Given A user "Charles" with email "charles@example.com" and password "shockwave"
    When I click login
    Then I go to the login page
    Then I fill out the login details
    Then I press login

