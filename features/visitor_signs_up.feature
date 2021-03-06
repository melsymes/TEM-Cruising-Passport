Feature: A visitor signs up

  As a new user to the Transeurope cruising passport I want to be able to sign up
  for the service in English, Spanish and French, and see all the communication
  in my language.

@email
@javascript

Scenario: A visitor signs up
  Given a visitor to the site
  Then select dutch
    And reload page
    And save snapshot "Dutch_homepage.png"
    And save and open "Dutch_homepage.html"
  Then select french
    And reload page
    And save snapshot "French_homepage.png"
    And save and open "French_homepage.html"
  Then select spanish
    And reload page
    And save snapshot "Spanish_homepage.png"
    And save and open "Spanish_homepage.html"
  Then select english
    And reload page
    And save snapshot "English_homepage.png"
    And save and open "English_homepage.html"
  Then I go to "Sign up"
    And save snapshot "English_signup_page.png"
    And save and open "English_signup_page.html"
  Then I sign up with name "charles", email "charles@example.com" and password "please"
    And  verify "A message with a confirmation link" on page
  Then verify I'm on the home page
    And it should send "charles@example.com" a "Confirmation instructions" email
  Then "charles@example.com" should have 1 email
  Then I open the email
  Then I follow "Confirm my account" in the email
  Then verify I'm on the home page
  Then verify "Get started today - Add your boat name" on page
  Then verify "Get started - connect with your marina" on page
    And save snapshot "charles_homepage_en.png"
    And save and open "charles_homepage_en.html"
  Then select spanish
    And reload page
    And save snapshot "charles_homepage_es.png"
    And save and open "charles_homepage_es.html"
  Then select french
    And reload page
    And save snapshot "charles_homepage_fr.png"
    And save and open "charles_homepage_fr.html"
  Then select dutch
    And reload page
    And save snapshot "charles_homepage_nl.png"
    And save and open "charles_homepage_nl.html"
  Then select english
    And reload page
    And save and open all text emails
  Then user logs out

@email
@javascript
Scenario: A spanish visitor signs up
  Given a visitor to the site
  Then select spanish
    And reload page
    And I go to "Registrarse"
    And save snapshot "Spanish_signup_page.png"
    And save and open "Spanish_signup_page.html"
  Then Visitor signs up with name "mel", email "mel@example.com" and password "spanish" with locale "es-ES"
  Then "mel@example.com" should have 1 email
    And I open the email
    And I follow "Confirmar mi cuenta" in the email
  Then save and open all text emails
  Then select english
  Then user logs out

@email
@javascript
Scenario: A French visitor signs up
  Given a visitor to the site
  Then select french
    And reload page
    And I go to "Signer"
    And save snapshot "French_signup_page.png"
    And save and open "French_signup_page.html"
  Then Visitor signs up with name "mel", email "mel@example.com" and password "french" with locale "fr-FR"
  Then "mel@example.com" should have 1 email
    And I open the email
    And I follow "Confirmer mon compte" in the email
  Then save and open all text emails
  Then select english
  Then user logs out










