Given(/^A user "(.*?)" with email "(.*?)" and password "(.*?)"$/) do |username, email, password|
  #@user = User.new(:email => email,
  #                 :username=>username,
  #                 :password => password,
  #                 :password_confirmation => password)
  #@user.save!
  visit root_path
end

When(/^I click login$/) do
  click_on "Login"
  #page.status_code.should == "200"
  #page.current_path.should has_text('sign_in')
  page.current_path.should == "/en" << new_user_session_path

  #response.should have_content("Sign in")
  #pending # express the regexp above with the code you wish you had
end

Then(/^I go to the login page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I fill out the login details$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I press login$/) do
  pending # express the regexp above with the code you wish you had
end
