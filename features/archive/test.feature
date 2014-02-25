Feature: test


Scenario: i18n
  Given my locale is "es-ES"
  Then visit root
  Then save and open "Spanish translated page"
  Then verify "Navegar por Europa " on page
  Given my locale is "en"


#@javascript
#Scenario: i18n, :driver => iphone do
#  Given my locale is "es-ES"
#  Then visit root
#  Then verify "Navegar por Europa " on page
#  Given my locale is "en"
#end













