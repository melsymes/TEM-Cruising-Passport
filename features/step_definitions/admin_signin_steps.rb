Given(/^One admin user$/) do
  @admin = User.create! :name => 'admin User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
  @admin.confirm!
  @admin.add_role :admin
end

Given(/^marina "(.*?)" with manager "(.*?)" at "(.*?)" with password "(.*?)"$/) do |marina, manager_name, manager_email, manager_password|
  @manager = User.create! :name => manager_name, :email => manager_email, :password => manager_password, :password_confirmation => manager_password
  @manager.confirm!
  @manager.add_role :manager
  @marina = Marina.create! :name => marina
  @marina.active_managers << @manager
  @marina.users << @manager

end

Then(/^marina "(.*?)" should have "(.*?)" manager$/) do |marina, managers|
  @marina.count_managers.should == managers.to_i
end

#login and sign up

Then(/^I login with email "(.*?)" and password "(.*?)"$/) do |email, password|
  visit root_path
  click_on "Login"

    fill_in 'Login with email', :with => email
    fill_in 'Password', :with => password
    #sleep 20
    click_on 'Sign in'

  page.should have_content 'Signed in successfully.'
  #sleep 5

end

Then(/^I sign up with name "(.*?)", email "(.*?)" and password "(.*?)"$/) do |name, email, password|

  within('.form-inputs') do
    fill_in 'Name', :with => name
    fill_in 'Email', :with => email
    fill_in( "Password", :with => password, :match => :prefer_exact)
    fill_in( "Password confirmation", :with => password, :match => :prefer_exact)
  end
  within('.form-actions') do
    click_on 'Sign up'
  end

end

Then(/^I fill in "(.*?)" "(.*?)"$/) do |key, text|
  fill_in key, :with => text
end

Given(/^a visitor to the site$/) do
  visit root_path
end

Given(/^my locale is "(.*?)"$/) do |locale|
  I18n.locale = locale
end

Then(/^visit root$/) do
  visit root_path
end



Then(/^I go to the Admin page$/) do

  #sleep 20
  click_on 'Admin'
  #sleep 5
  #pending # express the regexp above with the code you wish you had
end


Then(/^I go to "(.*?)"$/) do |page|
  click_on page
  #sleep 5
end

Then(/^user logs out$/) do
  click_on 'Logout'
  #sleep 5
end


# page content
Then(/^verify "(.*?)" on page$/) do |content|
  page.should have_content content
end

Then(/^verify I'm on the home page$/) do
  current_path.should == root_path << 'en'
  #sleep 5
end

Then(/^I connect with the marina$/) do
  click_on 'Connect'
  #save_and_open_page
  #sleep 5
end

Then(/^verify that I am pending with "(.*?)"$/) do |arg1|
  @marina.pending_users.first.name.should == @user.name
  #sleep 5
end

Then(/^verify my status is pending$/) do
  visit(user_path(I18n.locale, @user))
  page.should have_content 'PENDING'
  #sleep 5
  #save_and_open_page
  #sleep 5
  #pending # getting user_path right
  #@user.marina_state.should == 'PENDING'
  #pending
end

Then(/^save "(.*?)"$/) do |path|
  save_page(path)
end

Then(/^save and open "(.*?)"$/) do |path|
  save_and_open_page(path)
end

Then(/^verify that an email was sent to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

