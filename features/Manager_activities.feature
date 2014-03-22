Feature: Manager activities

  manager accepting users and other managers and
  giving them access

  Before do
  DatabaseCleaner.start
  end

  After do |scenario|
  DatabaseCleaner.clean
  end

@email
@javascript
Scenario: Manager role can only check boat owners and invite users
  Given One admin user
  Given marina "Dutch-marina" with manager "monica" at "monica@example.com" with password "password"
  Given A user "charles" with email "charles@example.com" and password "password"
  Given A user "mary" with email "mary@example.com" and password "password"
  Given A user "fraud" with email "fraud@example.com" and password "password"

  Then visit root
  Then I login with email "charles@example.com" and password "password"
    And I click "Marinas"
    And I click "Connect"
  #Then it should send "monica@example.com" a "One of your berth holders has registered for a Cruising Passport." email
  Then it should send "charles@example.com" a "Connect request sent" email
  Then "charles@example.com" should have 2 email
  Then I should receive an emails with subject "Connect request sent"
  And user logs out


  ##########################################
  # MARINA BERTHOLDER FUNCTIONS
  ##########################################

  #Monica valides a "charles" as a new bertholder
  Then I login with email "monica@example.com" and password "password"
  Then "monica@example.com" should have 2 email
    And I should receive an email with subject "One of your berth holders has registered for a Cruising Passport."
  Then I click "Dutch-marina"
    And I click "Validate berth holder"
  Then it should send "charles@example.com" a "TEM Membership Accepted" email


  #Monica expires a "charles" as a new bertholder
  Then I click "Expire berth holder"
  Then it should send "charles@example.com" a "TEM Account Expired" email

  #Monica re-instates "charles" as a new bertholder
  Then I click "Re-validate berth holder"
  And verify "Bertholder is now re-validated. a notification has been sent" on page
  Then it should send "charles@example.com" a "TEM Membership Accepted" email


  #Monica removes "charles" from the marina roster
  Then I click "Expire berth holder"
  Then I click "Remove berth holder record"
    And verify "charles" is not on page


  And user logs out






  ##########################################
  # MARINA MANAGER FUNCTIONS
  ##########################################

  Then visit root
  Then a clear email queue
  Then I login with email "mary@example.com" and password "password"
  And I click "Marinas"
  And I click "Connect"
  And user logs out

  #Monica validates Mary as new manager
  Then I login with email "monica@example.com" and password "password"
    And I should receive an email with subject "One of your berth holders has registered for a Cruising Passport."
  Then I click "Dutch-marina"
    And I click "Validate new manager account"
    And I click modal ok
  Then it should send "mary@example.com" a "TEM Manager Account Accepted" email
    And verify "Marina and manager are now connected" on page
    And verify "mary" is manager
  Then user logs out


  #Monica expires Mary as manager
  Then visit root
  Then I login with email "monica@example.com" and password "password"
  Then I click "Dutch-marina"
  And I follow "Expire manager" for "mary"
  Then it should send "mary@example.com" a "TEM Manager Account Expired" email
  And verify "Manager is now expired." on page
  And verify "mary" is not a manager
  Then user logs out


  #Monica re-instates Mary as manager
  Then visit root
  Then I login with email "monica@example.com" and password "password"
  Then I click "Dutch-marina"
  And I follow "Re-validate manager" for "mary"
  Then it should send "mary@example.com" a "TEM Manager Account Accepted" email
  And verify "Manager and marina are now connected." on page
  And verify "mary" is manager
  Then user logs out

  #Monica removes Mary from marina roster
  Then visit root
  Then I login with email "monica@example.com" and password "password"
  Then I click "Dutch-marina"
  And I follow "Expire manager" for "mary"
  Then it should send "mary@example.com" a "TEM Manager Account Expired" email
  And verify "Manager is now expired." on page
  And verify "mary" is not a manager
  Then I follow "Remove manager from list" for "mary"
  And verify "Manager has been removed." on page
  And verify "mary" is not on page
  Then user logs out




