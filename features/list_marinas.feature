Feature: A user lists marinas

  as a logged in user
  I want to go to the Marinas page
  so I can list all the marinas

  @javascript
  Scenario: A user logs in
    Given A user "Charles" with email "charles@example.com" and password "shockwave"
    Given one marinas
    Then I login with email "charles@example.com" and password "shockwave"
    Then I go to "Marinas"

