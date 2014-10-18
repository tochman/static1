Given(/^I am on the home page$/) do
  visit '/index.html'
  page.source.should have_selector('html')
  page.source.should have_selector('body')
end

Given(/^I am on the google site$/) do
  visit 'http://www.google.com'
end

Given(/^I search for "(.*?)"$/) do |query|
  fill_in('q', :with => query)
  find('input[name="btnG"]').click
end

Given(/^I visit the "(.*?)" page$/) do |page|
  visit 'public#{page}'
end

Then(/^I should see "(.*?)"$/) do |string|
  page.should have_content string
end

Then(/^I should see a navigation header$/) do
  page.should have_css('section#header')
end

Then(/^I should see a main content area$/) do
  page.should have_css('section#main')
end

Then(/^I should see a footer area$/) do
  page.should have_css('section#footer')
end

Then /^show me the page$/ do
  save_and_open_page
end

Then(/^I should see a link to "(.*?)"$/) do |link|
  page.should(have_css("a", :text => link))
end

Then /^(?:|I )should see the "([^\"]*)" link$/ do |link|
  page.should(have_css("a", :text => link))
end

Then /^(?:|I )should not see the "([^\"]*)" link$/ do |link|
  page.should_not(have_css("a", :text => link))
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )click "([^"]*)"$/ do |button|
  click_link_or_button(button)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

Then /^I should see a link that points to "([^"]*)"$/ do |href_destination|
  page.should have_xpath("//a[@href='#{href_destination}']")
end

Then(/^I should see "(.*?)" in the header$/) do |name|
  expect(page).to have_text name
end

