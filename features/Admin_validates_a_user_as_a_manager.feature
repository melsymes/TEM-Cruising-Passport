Feature: An admin validates a manager for a marina

  Initally there will be no users, so any users which connect to
  a marina is passed to the admin for approval - it is likely that
  they are a marina manager - The Admin can allocate this user as
  a manager. From this point on future connections go to the manager
  for approval.


Scenario: An admin validates a manager for a marina
  Given One admin user
  Given a marina called "Puerto Calero Marina"
  Given A user "Mel" with email "mel@example.com" and password "spanish"
  Then marina "Puerto Calero Marina" should have 0 managers


  Then "admin@example.com" should have 1 email
  Then they open the email
  Then I login with email "mel@example.com" and password "spanish"
  Then save and open "mel's home page.html"
  Then I open the email
  Then I click "Marinas"
  Then I click "Connect"
  Then save and open "Mel visits marina page as pending user.html"
  And visit root
  Then "admin@example.com" should have 2 email
  Then "mel@example.com" should have 2 email
  Then I open the email
  Then I should see "Hi Mel" in the email body
  Then I should not see "en," in the email subject
  Then I should not see "en," in the email body
  Then save and open "Mel's pending home page.html"
  And user logs out

  Then I login with email "admin@example.com" and password "please"
  And I go to "Admin"
  And save and open "Admin's page - before validation.html"
  And I click "Validate manager"
  Then marina "Puerto Calero Marina" should have 1 manager
  Then save and open "Admin's page - after validation.html"
  Then save and open all text emails


Scenario: Further connections are validated by marina manager
  Given One admin user
  Given marina "Puerto Calero Marina" with manager "Mel" at "mel@example.com" with password "spanish"
  Given A user "Charles" with email "charles@example.com" and password "please"
  Then marina "Puerto Calero Marina" should have 1 managers
  Then a clear email queue

  When I login with email "charles@example.com" and password "please"
  And I click "Marinas"
  And I click "Connect"
  And user logs out


  Then I login with email "admin@example.com" and password "please"
  And "admin@example.com" should have 0 email
  Then I click "Admin"
  And verify "Validate Manager" is not on page
  Then user logs out

  Then I login with email "mel@example.com" and password "spanish"
  Then I click "Puerto Calero Marina"
  And save and open "Puerto Calero Marina page - before validation.html"
  Then verify "Charles" on page
  And verify "Validate berth holder" on page
  When I click "Validate berth holder"
  Then verify "Validate berth holder" is not on page
  Then save and open "Puerto Calero Marina page - after validation.html"
  Then user logs out


  When I login with email "charles@example.com" and password "please"
  Then verify "Signed in successfully" on page
  And verify "VALIDATED-BERTHOLDER" on page
  Then save and open all text emails





















