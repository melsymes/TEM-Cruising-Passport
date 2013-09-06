Feature: test

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










