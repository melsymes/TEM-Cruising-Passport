Feature: A Manager validates a bertholder for their marina

 Once a marina has a manger, application requests will come
 to the manager for validation.

  Before do
  DatabaseCleaner.start
  end

  After do |scenario|
  DatabaseCleaner.clean
  end

@email
@javascript
Scenario: Further connections are validated by marina manager
Given One admin user
Given marina "Puerto Calero Marina" with manager "Mel" at "mel@example.com" with password "spanish"
Given A user "Charles" with email "charles@example.com" and password "please"
Then marina "Puerto Calero Marina" should have 1 managers
Then a clear email queue
And visit root

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
