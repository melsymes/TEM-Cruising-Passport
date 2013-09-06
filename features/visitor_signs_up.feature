Feature: A visitor signs up

  As a visitor to the TEM passport site I want to be able to sign up

@email
@javascript
Scenario: A visitor signs up
  Given a visitor to the site
  Then I go to "Sign up"
  Then I sign up with name "Charles", email "charles@example.com" and password "please"
  Then verify I'm on the home page
  And  verify "A message with a confirmation link" on page
  Then verify I'm on the home page
  And it should send "charles@example.com" a "Confirmation instructions" email
  Then "charles@example.com" should have 1 email
  Then I open the email
  Then I follow "Confirm my account" in the email
  Then verify I'm on the home page
  Then verify "Get started today - Add your boat name" on page
  Then verify "Get started - connect with your marina" on page

@javascript
Scenario: The new user updates their boat name in the account
  Given A user "Charles" with email "charles@example.com" and password "shockwave"
  Then I login with email "charles@example.com" and password "shockwave"
  Then I go to "Finish registration"
  Then I fill in "Boat name" "Shockwave"
  Then I fill in "Current password" "shockwave"
  Then I go to "Update"
  Then verify "You updated your account successfully." on page
  Then verify "Shockwave is now registered" on page

  @javascript
Scenario: User connects with marina
  Given A user "Charles" with email "charles@example.com" and password "shockwave"
  Given marina "Puerto Calero Marina" with manager "Mel" at "mel@example.com" with password "spainish"
  Then marina "Puerto Calero Marina" should have "1" manager
  Then I login with email "charles@example.com" and password "shockwave"
  And verify I'm on the home page
  And "charles@example.com" should have 1 email
  And "mel@example.com" should have 1 email
  Then I open the email
  Then I go to "Marinas"
  Then I connect with the marina
  And "charles@example.com" should have 2 email
  And "mel@example.com" should have 2 email
  And verify my status is pending
  Then I open the email
  Then verify "Your passport code will be available when your marina has validated your application." on page
  Then verify "Current marina status: PENDING" on page
  Then verify "Name: Charles" on page
  Then verify "Email: charles@example.com" on page
  Then verify "Boat name:" on page
  Then save "user_home.html"
  Then user logs out
  Then I login with email "mel@example.com" and password "spainish"
  And verify I'm on the home page
  Then save and open "Mel's home page"
  Then I go to "Puerto Calero Marina"
  Then verify "Manager's Admin Page" on page
  Then I go to "Validate berth holder"
  Then verify "Bertholder and marina are now connected. a notification email has been sent" on page
  And "charles@example.com" should have 3 email
  And "mel@example.com" should have 2 email
  Then user logs out
  Then I login with email "charles@example.com" and password "shockwave"
  Then verify "Signed in successfully." on page
  Then verify "Your current status is VALIDATED-BERTHOLDER" on page
  Then verify "Your passport code is - " on page
  Then save and open all text emails
  Then save and open "User connected and setup"








