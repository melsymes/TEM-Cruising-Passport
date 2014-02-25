Feature: Admin changes the state and role of a user

  The administrator is presented with a list of all the users of the system.
  They can validate another administrator or validate a manager, if that marina has no managers.
  They can delete a user and change a user's role from nothing to admin or manager and back again.



@javascript
Scenario: Admin changes state of a user
  Given One admin user
  Given marina "Puerto Calero Marina" with manager "Mel" at "mel@example.com" with password "spanish"
  Given A user "charles" with email "charles@example.com" and password "please"
  Then I login with email "charles@example.com" and password "please"
    And I click "Marinas"
    And I click "Connect"
    And user logs out
  Then I login with email "admin@example.com" and password "please"
  And I click "Admin"
  Then verify "charles" has no role
  And save snapshot "1charles_admin.png"
  And I follow "admin" for "charles"
  And I click modal ok
  And save snapshot "2charles_admin.png"
  Then verify "charles" is admin
  Then I follow "remove admin" for "charles"
  And save snapshot "3charles_admin.png"
  And verify "charles" has no role
  Then I follow "manager" for "charles"
  And I click modal ok
  And save snapshot "4charles_admin.png"
  And verify "charles" is manager
  And user logs out

@javascript
Scenario: Manager role can only check boat owners and invite users
  Given One admin user
  Given marina "Puerto Calero Marina" with manager "Mel" at "mel@example.com" with password "spanish"
  Given A user "charles" with email "charles@example.com" and password "please"
  Then I login with email "admin@example.com" and password "please"
  And I click "Admin"
  Then verify "charles" has no role
  And I follow "manager" for "charles"
  And I click modal ok
  Then visit root
  Then verify "charles" is manager
  And user logs out
  Then I login with email "charles@example.com" and password "please"
  And I click "Marinas"
  And I click "Connect"
  Then I click "Puerto Calero Marina"
  And save and open "manager view.html"
  Then verify "Manager's Administration Page" is not on page
  Then visit root
  And verify "Code (or name) here" on page
  And save and open "manager home view.html"
  Then go to the page for "Mel"
  And verify I'm on the home page
  Then go to the page for "admin User"
  And verify I'm on the home page
  Then go to the page for "charles"
  And verify "charles" on page
  And user logs out

@javascript
Scenario: A Validated, connected manager can invite, see & edit the marina manifest
  Given marina "Puerto Calero Marina" with manager "Mel" at "mel@example.com" with password "spanish"
  Given A user "charles" with email "charles@example.com" and password "please"
  Given A user "simon" with email "simon@example.com" and password "please"
  Then I login with email "charles@example.com" and password "please"
  And I click "Marinas"
  And I click "Connect"
  Then user logs out

  Then I login with email "mel@example.com" and password "spanish"
  Then I click "Puerto Calero Marina"
  And I click "Validate new manager account"
  And I click modal ok
  And user logs out

  Then I login with email "charles@example.com" and password "please"
  Then I click "Puerto Calero Marina"
  And verify "Manager's Administration Page" on page
  Then I fill in "user_email" "anew@example.com"
  Then I click "Invite user"
  And save and open "invite user"
  And verify "[SET MY NAME]" on page
  Then I click "[SET MY NAME]"
  And I fill in "Name" "Simon"
  And I fill in "Boat name" "Shockwave"
  And I click "Update User"
  Then verify "User updated" on page
  Then verify "Simon" on page









