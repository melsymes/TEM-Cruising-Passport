Feature: An admin validates a manager for a marina

  Initally there will be no users, so any users which connect to
  a marina is passed to the admin for approval - it is likely that
  they are a marina manager - The Admin can allocate this user as
  a manager. From this point on future connections go to the manager
  for approval.

  Before do
    DatabaseCleaner.start
  end

After do |scenario|
  DatabaseCleaner.clean
end

  @email
  @javascript
Scenario: An admin validates a manager for a marina
  Given One admin user
  Given a marina called "Puerto Calero Marina"
  Given A user "mel" with email "mel@example.com" and password "spanish"
  Then marina "Puerto Calero Marina" should have 0 managers
  Then visit root

  When I login with email "mel@example.com" and password "spanish"
  Then I click "Marinas"
  Then I click "Connect"
  Then it should send "mel@example.com" a "Connect request sent" email
  Then "mel@example.com" should have 2 email
  Then I should receive an emails with subject "Connect request sent"
  And user logs out

  Then visit root
  Then I login with email "admin@example.com" and password "please"
  Then "admin@example.com" should have 2 email
  And I should receive an emails with subject "TEM user registration"

  And I go to "Admin"
  And I click "Validate manager"

  Then marina "Puerto Calero Marina" should have 1 manager
























