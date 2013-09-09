Feature: An admin validates a manager for a marina

  Initally there will be no users, so any users which connect to
  a marina is passed to the admin for approval - it is likely that
  they are a marina manager - The Admin can allocate this user as
  a manager. From this point on future connections go to the manager
  for approval.


Scenario: An admin validates a manager for a marina
  Given One admin user
  Given one marinas
  Given A user "Mel" with email "mel@example.com" and password "spanish"
  Then "user@example.com" should have 1 email
  Then they open the email
  Then I login with email "mel@example.com" and password "spanish"
  Then save and open "mel's home page"
  Then I open the email
  Then I go to "Marinas"
  Then I go to "Connect"
  Then "user@example.com" should have 2 email
  Then "mel@example.com" should have 2 email
  Then I open the email
  Then they should see "Hi Mel" in the email body
  Then they should see "Hi Mel" in the email body
  Then they should not see "en," in the email subject
  Then they should not see "en," in the email body
  Then save and open all text emails




