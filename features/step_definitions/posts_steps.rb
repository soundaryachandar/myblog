Given /^a user is logged in as "(.*)"$/ do |login|
  @current_user = User.create!(
    :login => login,
    :password => 'generic',
    :password_confirmation => 'generic',
    :email => "#{login}@example.com"
  )

  # :create syntax for restful_authentication w/ aasm. Tweak as needed.
   @current_user.activate! 

  visit "/login" 
  fill_in("login", :with => login) 
  fill_in("password", :with => 'generic') 
  click_button("Log in")
  response.body.should =~ /Logged/m  
end




Given /^I have posts titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Post.create!(:title => title,:body=>body)
  end
end

Then /^(?:|I )should see "([^"]*)$/ do |text|
  Post.find_by_title(text)
end

