Given(/^I am on the home page$/) do
  visit 'index.html'
  page.source.should have_selector('html')
  page.source.should have_selector('body')
end

Given(/^I am on the "(.*?)" page$/) do |page|
  visit '/#{page}'
end

Then(/^I should see "(.*?)"$/) do |string|
  page.should have_content string
end

