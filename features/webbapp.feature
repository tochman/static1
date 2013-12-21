Feature: As a developer,
  In order to be able to develop the webb app
  I want to set up the technical enviroment

Scenario: Load the home page/template
  Given I am on the home page
  Then I should see a navigation header
  And I should see a main content area
  And I should see a footer area

Scenario: Make sure page is including all what we need
  Given I am on the home page
  Then the page should be titled "Start"
  And the page should have a meta tag for "author"
  And the page should have a meta tag for "description"
  And the page should include css for bootstrap.css
  And the page should include js for jquery.js
  And the page should include js for bootstrap.js
  And the page should include script for Google Analytics




