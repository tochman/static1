Feature: As a developer,
  In order to be able to develop the webb app
  I want to set up the technical enviroment

Scenario: Load the site
  Given I am on the home page
  Then I should see a navigation header
  And I should see a main content area
  And I should see a footer area

  Scenario: Search with www.google.com
    Given I am on the google site
    And I search for "Sweden"
    Then show me the page
    Then I should see a link to "Sweden - Wikipedia, the free encyclopedia"


