Given(/^I navigate to home page$/) do
  create_browser
  usps.home_page.visit
end

Then(/^I click on Login button$/) do
  usps.home_page.login_button.click
end

And(/^I type "([^"]*)" as a login$/) do |login|
  usps.login_page.login_field.send_keys login
end

And(/^I type "([^"]*)" as a password$/) do |password|
  usps.login_page.password_field.send_keys password
end

Then(/^I click on Signin button$/) do
  usps.login_page.sign_in_button.click
end

And(/^I should be signed\-in as a user "([^"]*)"$/) do |name|
  expected_value = "Hi, #{name}"
  expect(usps.home_page.login_button.text).to be == expected_value
end

And(/^I should get "([^"]*)"$/) do |user_error_message|
  if usps.login_page.login_field.attribute('value').empty?
    error = usps.home_page.no_user_error_message
  else
    error = usps.home_page.wrong_password_error_message
  end
  expect(error.text).to be == user_error_message
  expect(error.displayed?).to be == true
  puts "Actual message is: " + user_error_message.to_s
end
