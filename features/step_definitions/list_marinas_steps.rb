Given(/^A user "(.*?)" with email "(.*?)" and password "(.*?)"$/) do | name, email, password|
  @user = User.create! :email => email, :name=>name, :password => password, :password_confirmation => password
  @user.confirm!
end

Given(/^all marinas$/) do
  marina1 = Marina.create! :name => 'Alcaidesa Marina'
  marina2 = Marina.create! :name => 'Bangor Marina'
  marina3 = Marina.create! :name => 'Beaucette Marina'
  marina4 = Marina.create! :name => 'Birdham Pool Marina'
  marina5 = Marina.create! :name => 'Brundall Bay Marina'
  marina6 = Marina.create! :name => 'Bucklers Hard Yacht Harbour'
  marina7 = Marina.create! :name => 'Conwy Quays Marina'
  marina8 = Marina.create! :name => 'Deganwy Marina'
  marina9 = Marina.create! :name => 'Delta Marina'
  marina10 = Marina.create! :name => 'Douro Marina'
  marina11 = Marina.create! :name => 'Dover Marina'
  marina12 = Marina.create! :name => 'Dunkerque Marina'
  marina13 = Marina.create! :name => 'Eastwood Marina'
  marina14 = Marina.create! :name => 'Fambridge Yacht Haven'
  marina15 = Marina.create! :name => 'Fleetwood Haven Marina'
  marina16 = Marina.create! :name => 'Foxs Marina'
  marina17 = Marina.create! :name => 'Gillingham Marina'
  marina18 = Marina.create! :name => 'Hull Marina'
  marina19 = Marina.create! :name => 'Jachthaven Wetterwille'
  marina20 = Marina.create! :name => 'Jersey Marina'
  marina21 = Marina.create! :name => 'Kilrush Marina'
  marina22 = Marina.create! :name => 'Le Moulin Blanc Marina'
  marina23 = Marina.create! :name => 'Liverpool Marina'
  marina24 = Marina.create! :name => 'Lowestoft Haven Marina'
  marina25 = Marina.create! :name => 'Malahide Marina'
  marina26 = Marina.create! :name => 'Marina Coruna'
  marina27 = Marina.create! :name => 'Marina de Portimao'
  marina28 = Marina.create! :name => 'Marina La Palma'
  marina29 = Marina.create! :name => 'Marina Port Zelande'
  marina30 = Marina.create! :name => 'Marina Seaport IJmuidan'
  marina31 = Marina.create! :name => 'Mayflower Marina'
  marina32 = Marina.create! :name => 'Mylor Yacht Harbour'
  marina33 = Marina.create! :name => 'Neyland Yacht Haven'
  marina34 = Marina.create! :name => 'P.D. Juan Montiel'
  marina35 = Marina.create! :name => 'Penarth Quays'
  marina36 = Marina.create! :name => 'Pobla Marina'
  marina37 = Marina.create! :name => 'Port de Caen'
  marina38 = Marina.create! :name => 'Port Edgar Marina'
  marina39 = Marina.create! :name => 'Port Ginesta'
  marina40 = Marina.create! :name => 'Port Medoc'
  marina41 = Marina.create! :name => 'Portishead Quays Marina'
  marina42 = Marina.create! :name => 'Puerto Calero Marina'
  marina43 = Marina.create! :name => 'Puerto Deportivo Gijon'
  marina44 = Marina.create! :name => 'Rhu Marina'
  marina45 = Marina.create! :name => 'Royal Clarence Marina'
  marina46 = Marina.create! :name => 'Royal Quays Marina'
  marina47 = Marina.create! :name => 'Saint-Quay Port d Armor'
  marina48 = Marina.create! :name => 'Saint-Valery sur Somme'
  marina49 = Marina.create! :name => 'Tollesbury Marina'
  marina50 = Marina.create! :name => 'Troon Yacht Haven'
  marina51 = Marina.create! :name => 'Universal Marina'
  marina52 = Marina.create! :name => 'Upton Marina'
  marina53 = Marina.create! :name => 'VVW Nieuwpoort'
  marina54 = Marina.create! :name => 'Whitehaven Marina'
end

Given(/^one marina$/) do
  marina1 = Marina.create! :name => 'Puerto Calero Marina'
end

When(/^I click login$/) do
  click_on "Login"
  #page.status_code.should == "200"
  #page.current_path.should has_text('sign_in')
  page.current_path.should == "/en" << new_user_session_path

  #response.should have_content("Sign in")
  #pending # express the regexp above with the code you wish you had
end

