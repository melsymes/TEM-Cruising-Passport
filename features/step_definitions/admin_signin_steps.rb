Given(/^One admin user$/) do
  @admin = User.create! :name => 'admin User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
  @admin.confirm!
  @admin.add_role :admin

end

Then(/^I login with email "(.*?)" and password "(.*?)"$/) do |email, password|
  visit root_path
  click_on "Login"
  #sleep 2
  #within ('#container') do
    fill_in 'Login with email', :with => email
    fill_in 'Password', :with => password
    #sleep 20
    click_on 'Sign in'
  #end
  page.should have_content 'Signed in successfully.'
  sleep 5
  #pending # express the regexp above with the code you wish you had
end


Then(/^I go to the Admin page$/) do

  #sleep 20
  click_on 'Admin'
  sleep 5
  #pending # express the regexp above with the code you wish you had
end


Then(/^I go to "(.*?)"$/) do |page|
  click_on page
  sleep 5
end

Then(/^user logs out$/) do
  click_on 'Logout'
  sleep 5
end


Then(/^verify I'm on the home page$/) do
  current_path.should == root_path << 'en'
  sleep 5
end

Then(/^I connect with the marina$/) do
  click_on 'Connect'
  #save_and_open_page
  sleep 5
end

Then(/^verify that I am pending with "(.*?)"$/) do |arg1|
  @marina.pending_users.first.name.should == @user.name
  sleep 5
end

Then(/^verify my status is pending$/) do
  visit(user_path(I18n.locale, @user))
  page.should have_content 'PENDING'
  sleep 5
  save_and_open_page
  sleep 5
  #pending # getting user_path right
  #@user.marina_state.should == 'PENDING'
  #pending
end

Then(/^verify that an email was sent to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

